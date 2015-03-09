#include <xdc/std.h>

#include "package/internal/AdcSeq.xdc.h"

/* const */ AdcSeq_Info * AdcSeq_getInfo(AdcSeq_Object *obj)
{
    return &obj->info;
}

