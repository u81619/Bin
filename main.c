#include <ps4.h>

int _main(struct thread *td, void *uap) {
    initKernel();
    initLibc();
    
    char msg[100];
    sprintf(msg, "Hello World! \n haider is here");

    sceSysUtilSendSystemNotificationWithText(222, msg);

    return 0;
}
