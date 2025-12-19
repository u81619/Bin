#ifndef SYSTEMUTIL_H
#define SYSTEMUTIL_H

#ifdef __cplusplus
extern "C" {
#endif

// Notification types
#define NOTIFICATION_TYPE_TEXT 0x222

void sceSysUtilSendSystemNotificationWithText(int type, char* message);

#ifdef __cplusplus
}
#endif

#endif

