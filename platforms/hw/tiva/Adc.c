#include <xdc/std.h>

#include "package/internal/Adc.xdc.h"

/* const */ Adc_Info * Adc_getInfo(Adc_Object *obj)
{
    return &obj->info;
}

