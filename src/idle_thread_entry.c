#include "idle_thread.h"

#include "FreeRTOS.h"
#include "task.h"
#include "stdio.h"
#include "lwip/sio.h"
#include "netif/ppp/pppos.h"




static sio_fd_t ppp_sio;
static ppp_pcb *ppp;
static struct netif pppos_netif;

u32_t renesas_sio_read(void* p_driver,uint8_t *buff,uint32_t length);
u32_t renesas_sio_write(void* p_driver,uint8_t *buff,uint32_t length);
void renesas_sio_open(unsigned int dev);

u32_t renesas_sio_read(void* p_driver,uint8_t *buff,uint32_t length){
    (void)p_driver;
    (void)buff;
    (void)length;
    // User code
    // End user code
    return 0;
}
u32_t renesas_sio_write(void* p_driver,uint8_t *buff,uint32_t length){
    (void)p_driver;
    (void)buff;
    (void)length;
    // User code
    // End user code
    return 0;
}
void renesas_sio_open(unsigned int dev){
    (void)dev;
    // User code
    // End user code
}

u32_t sio_read(sio_fd_t fd, u8_t *data, u32_t len){
    return renesas_sio_read(fd, data, len);
}

u32_t sio_write(sio_fd_t fd, u8_t *data, u32_t len){
    return renesas_sio_write(fd, data, len);
}

sio_fd_t sio_open(u8_t devnum){
    renesas_sio_open(devnum);
    return NULL;
}

static void
pppos_rx_thread(void *arg)
{
  u32_t len;
  u8_t buffer[128];
  LWIP_UNUSED_ARG(arg);

  /* Please read the "PPPoS input path" chapter in the PPP documentation. */
  while (1) {
    len = sio_read(ppp_sio, buffer, sizeof(buffer));
    if (len > 0) {
      /* Pass received raw characters from PPPoS to be decoded through lwIP
       * TCPIP thread using the TCPIP API. This is thread safe in all cases
       * but you should avoid passing data byte after byte. */
      pppos_input_tcpip(ppp, buffer, len);
    }
  }
}

static void
ppp_link_status_cb(ppp_pcb *pcb, int err_code, void *ctx)
{
    struct netif *pppif = ppp_netif(pcb);
    LWIP_UNUSED_ARG(ctx);

    switch(err_code) {
    case PPPERR_NONE:               /* No error. */
        {
#if LWIP_DNS
        const ip_addr_t *ns;
#endif /* LWIP_DNS */
        fprintf(stderr, "ppp_link_status_cb: PPPERR_NONE\n\r");
#if LWIP_IPV4
        fprintf(stderr, "   our_ip4addr = %s\n\r", ip4addr_ntoa(netif_ip4_addr(pppif)));
        fprintf(stderr, "   his_ipaddr  = %s\n\r", ip4addr_ntoa(netif_ip4_gw(pppif)));
        fprintf(stderr, "   netmask     = %s\n\r", ip4addr_ntoa(netif_ip4_netmask(pppif)));
#endif /* LWIP_IPV4 */
#if LWIP_IPV6
        fprintf(stderr, "   our_ip6addr = %s\n\r", ip6addr_ntoa(netif_ip6_addr(pppif, 0)));
#endif /* LWIP_IPV6 */

#if LWIP_DNS
        ns = dns_getserver(0);
        fprintf(stderr, "   dns1        = %s\n\r", ipaddr_ntoa(ns));
        ns = dns_getserver(1);
        fprintf(stderr, "   dns2        = %s\n\r", ipaddr_ntoa(ns));
#endif /* LWIP_DNS */
#if PPP_IPV6_SUPPORT
        fprintf(stderr, "   our6_ipaddr = %s\n\r", ip6addr_ntoa(netif_ip6_addr(pppif, 0)));
#endif /* PPP_IPV6_SUPPORT */
        }
        break;

    case PPPERR_PARAM:             /* Invalid parameter. */
        printf("ppp_link_status_cb: PPPERR_PARAM\n");
        break;

    case PPPERR_OPEN:              /* Unable to open PPP session. */
        printf("ppp_link_status_cb: PPPERR_OPEN\n");
        break;

    case PPPERR_DEVICE:            /* Invalid I/O device for PPP. */
        printf("ppp_link_status_cb: PPPERR_DEVICE\n");
        break;

    case PPPERR_ALLOC:             /* Unable to allocate resources. */
        printf("ppp_link_status_cb: PPPERR_ALLOC\n");
        break;

    case PPPERR_USER:              /* User interrupt. */
        printf("ppp_link_status_cb: PPPERR_USER\n");
        break;

    case PPPERR_CONNECT:           /* Connection lost. */
        printf("ppp_link_status_cb: PPPERR_CONNECT\n");
        break;

    case PPPERR_AUTHFAIL:          /* Failed authentication challenge. */
        printf("ppp_link_status_cb: PPPERR_AUTHFAIL\n");
        break;

    case PPPERR_PROTOCOL:          /* Failed to meet protocol. */
        printf("ppp_link_status_cb: PPPERR_PROTOCOL\n");
        break;

    case PPPERR_PEERDEAD:          /* Connection timeout. */
        printf("ppp_link_status_cb: PPPERR_PEERDEAD\n");
        break;

    case PPPERR_IDLETIMEOUT:       /* Idle Timeout. */
        printf("ppp_link_status_cb: PPPERR_IDLETIMEOUT\n");
        break;

    case PPPERR_CONNECTTIME:       /* PPPERR_CONNECTTIME. */
        printf("ppp_link_status_cb: PPPERR_CONNECTTIME\n");
        break;

    case PPPERR_LOOPBACK:          /* Connection timeout. */
        printf("ppp_link_status_cb: PPPERR_LOOPBACK\n");
        break;

    default:
        printf("ppp_link_status_cb: unknown errCode %d\n", err_code);
        break;
    }
}

static u32_t
ppp_output_cb(ppp_pcb *pcb, u8_t *data, u32_t len, void *ctx)
{
  LWIP_UNUSED_ARG(pcb);
  LWIP_UNUSED_ARG(ctx);
  return sio_write(ppp_sio, data, len);
}

#if LWIP_NETIF_STATUS_CALLBACK
static void
netif_status_callback(struct netif *nif)
{
  printf("PPPNETIF: %c%c%d is %s\n", nif->name[0], nif->name[1], nif->num,
         netif_is_up(nif) ? "UP" : "DOWN");
#if LWIP_IPV4
  printf("IPV4: Host at %s ", ip4addr_ntoa(netif_ip4_addr(nif)));
  printf("mask %s ", ip4addr_ntoa(netif_ip4_netmask(nif)));
  printf("gateway %s\n", ip4addr_ntoa(netif_ip4_gw(nif)));
#endif /* LWIP_IPV4 */
#if LWIP_IPV6
  printf("IPV6: Host at %s\n", ip6addr_ntoa(netif_ip6_addr(nif, 0)));
#endif /* LWIP_IPV6 */
#if LWIP_NETIF_HOSTNAME
  printf("FQDN: %s\n", netif_get_hostname(nif));
#endif /* LWIP_NETIF_HOSTNAME */
}
#endif /* LWIP_NETIF_STATUS_CALLBACK */

void
pppos_example_init(void)
{
#if PPPOS_SUPPORT
#if PPP_PTY_TEST
  ppp_sio = sio_open(2);
#else
  ppp_sio = sio_open(0);
#endif
  if(!ppp_sio)
  {
      perror("PPPOS example: Error opening device");
      return;
  }

  ppp = pppos_create(&pppos_netif, ppp_output_cb, ppp_link_status_cb, NULL);
  if (!ppp)
  {
      printf("PPPOS example: Could not create PPP control interface");
      return;
  }

#ifdef LWIP_PPP_CHAP_TEST
  ppp_set_auth(ppp, PPPAUTHTYPE_CHAP, "lwip", "mysecret");
#endif

  ppp_connect(ppp, 0);

#if LWIP_NETIF_STATUS_CALLBACK
  netif_set_status_callback(&pppos_netif, netif_status_callback);
#endif /* LWIP_NETIF_STATUS_CALLBACK */

  sys_thread_new("pppos_rx_thread", pppos_rx_thread, NULL, DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
#endif /* PPPOS_SUPPORT */
}
/* IDLE_TASK entry function */
/* pvParameters contains TaskHandle_t */
void idle_thread_entry(void *pvParameters)
{
    FSP_PARAMETER_NOT_USED (pvParameters);
    pppos_example_init();
    /* TODO: add your own code here */
    while (1)
    {
        vTaskDelay (1);
    }
}


void vApplicationStackOverflowHook( TaskHandle_t xTask,char * pcTaskName ){
    printf("Task %s Overflow\r\n",pcTaskName);
    vTaskDelete(xTask);
    NVIC_SystemReset();
    while(1);
}
