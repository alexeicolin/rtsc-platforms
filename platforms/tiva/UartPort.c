#include <xdc/std.h>

#include "package/internal/UartPort.xdc.h"

/* const */ UartPort_Info * UartPort_getInfo(UartPort_Object *obj)
{
    return &obj->info;
}

