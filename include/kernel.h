#ifndef KERNEL_H
#define KERNEL_H

#include <stdint.h>

void initKernel(void);

#define SYSCALL_MAX 653

struct thread;

// Common Syscalls
int syscall(int num, ...);
int sys_getpid(void);
int sys_setuid(int uid);

#endif

