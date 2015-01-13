#include <xdc/std.h>

#include "package/internal/GpioPeriph.xdc.h"

/* const */ GpioPeriph_Info * GpioPeriph_getInfo(GpioPeriph_Object *obj)
{
    return &obj->info;
}

