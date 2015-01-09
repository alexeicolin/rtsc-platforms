#include <xdc/std.h>

#include "package/internal/AdcChan.xdc.h"

/* const */ AdcChan_Info * AdcChan_getInfo(AdcChan_Object *obj)
{
    return &obj->info;
}

