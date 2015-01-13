#include <xdc/std.h>

#include "package/internal/GpTimer.xdc.h"

/* const */ GpTimer_Info * GpTimer_getInfo(GpTimer_Object *obj)
{
    return &obj->info;
}

