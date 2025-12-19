#ifndef PS4_H
#define PS4_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#include <kernel.h>
#include <libc.h>
#include <network.h>
#include <systemutil.h>

// Definitions for 9.00 firmware support
#define FW_900

#ifdef __cplusplus
extern "C" {
#endif

// Kernel functions base initialization
void initKernel(void);
void initLibc(void);
void initNetwork(void);

// Common notification helper for PS4
void sceSysUtilSendSystemNotificationWithText(int messageType, char* message);

#ifdef __cplusplus
}
#endif

#endif
