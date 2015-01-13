#include <xdc/std.h>

#include "package/internal/GpioPort.xdc.h"

/* const */ GpioPort_Info * GpioPort_getInfo(GpioPort_Object *obj)
{
    return &obj->info;
}

