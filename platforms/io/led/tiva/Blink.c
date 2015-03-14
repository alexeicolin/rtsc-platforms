#include <xdc/std.h>

#include <platforms/io/led/tiva/Led.h>

#include "package/internal/Blink.xdc.h"

Void Blink_blinkLed(UInt led, UInt32 rate)
{
    Blink_LedState *ledState = &module->ledState.elem[led];
    ledState->on = FALSE;
    ledState->blinkRate = rate;
}

Void Blink_blinkTick(UArg arg)
{
    Int led;
    Blink_LedState *ledState;
    for (led = 0; led < module->ledState.length; ++led) {
        ledState = &module->ledState.elem[led];
        if (ledState->blinkRate &&
            module->blinkTicks % ledState->blinkRate == 0) {
            ledState->on = !ledState->on;
            Led_setLed(led, ledState->on);
        }
    }
    module->blinkTicks++;
}
