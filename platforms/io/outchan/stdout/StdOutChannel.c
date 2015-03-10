#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <stdio.h>

#include "package/internal/StdOutChannel.xdc.h"

Void StdOutChannel_outputStdOut(const Char *buf, Int size) {
    // This is what SysMin does if no output func is defined
    fwrite(buf, 1, size, stdout);
}

Void StdOutChannel_outputEventLog(const Char *buf, Int size) {
    Int i;
    for (i = 0; i < size; ++i)
        System_putch(buf[i]);
}
