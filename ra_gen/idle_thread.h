/* generated thread header file - do not edit */
#ifndef IDLE_THREAD_H_
#define IDLE_THREAD_H_
#include "bsp_api.h"
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "hal_data.h"
#ifdef __cplusplus
                extern "C" void idle_thread_entry(void * pvParameters);
                #else
extern void idle_thread_entry(void *pvParameters);
#endif
FSP_HEADER
FSP_FOOTER
#endif /* IDLE_THREAD_H_ */
