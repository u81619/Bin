#include "ps4.h"

int _main(struct thread *td, void *uap) {
    char msg[100] = {0};
    const char* text = "Hello World! \n haider is here.";
    
    for(int i = 0; text[i] != '\0' && i < 99; i++) {
        msg[i] = text[i];
    }

    sceSysUtilSendSystemNotificationWithText(222, msg);

    return 0;
}
