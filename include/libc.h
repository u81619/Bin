#ifndef LIBC_H
#define LIBC_H

#include <stdarg.h>
#include <stddef.h>

void initLibc(void);

int sprintf(char* str, const char* format, ...);
int snprintf(char* str, size_t size, const char* format, ...);
void* malloc(size_t size);
void free(void* ptr);
void* memset(void* destination, int value, size_t num);
void* memcpy(void* destination, const void* source, size_t num);

#endif

