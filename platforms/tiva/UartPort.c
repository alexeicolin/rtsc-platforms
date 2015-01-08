#include <xdc/std.h>

#include "package/internal/UartPort.xdc.h"

/* const */ UartPort_PortInfo * UartPort_getInfo(UartPort_Object *obj)
{
    return &obj->portInfo;
}

