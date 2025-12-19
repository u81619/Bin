#include "ps4.h"

int _main(struct thread *td, void *uap) {
    initKernel();
    initLibc();
    
    char msg[100];
    for(int i=0; i<100; i++) msg[i] = 0;
    
    char* text = "Hello World! \n Gemini is here.";
    for(int i=0; text[i] != '\0'; i++) msg[i] = text[i];

    sceSysUtilSendSystemNotificationWithText(222, msg);

    return 0;
}

