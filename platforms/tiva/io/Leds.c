#include <xdc/std.h>
#include <xdc/runtime/Startup.h>
#include <ti/drivers/GPIO.h>

#include <platforms/tiva/hw/GpioPort.h>
#include <platforms/tiva/hw/GpioPeriph.h>

#include <stdint.h>
#include <stdbool.h>
#include <inc/hw_memmap.h>
#include <driverlib/gpio.h>
#include <driverlib/sysctl.h>

#include "package/internal/Leds.xdc.h"

#define LED_OFF (0)
#define LED_ON  (~0)

// Snice can't initialize GPIO_Config in meta domain, have this limit here
#define MAX_LEDS 8

// Globally visible symbol for ti.drivers.GPIO
GPIO_Config GPIO_config[MAX_LEDS];

static GPIO_HWAttrs gpioHWAttrs[MAX_LEDS];

Void Leds_setLed(UInt led, Bool on)
{
    GPIO_write(led, on ? LED_ON : LED_OFF);
}

Void Leds_pulseLed(UInt led)
{
    Int i = Leds_pulseDelayIters;
    Leds_setLed(led, TRUE);
    while (i--);
    Leds_setLed(led, FALSE);
}

Void Leds_blinkLed(UInt led, UInt32 rate)
{
    Leds_LedState *ledState = &module->ledState.elem[led];
    ledState->on = FALSE;
    ledState->blinkRate = rate;
}

Void Leds_blinkTick(UArg arg)
{
    Int led;
    Leds_LedState *ledState;
    for (led = 0; led < module->ledState.length; ++led) {
        ledState = &module->ledState.elem[led];
        if (ledState->blinkRate &&
            module->blinkTicks % ledState->blinkRate == 0) {
            ledState->on = !ledState->on;
            Leds_setLed(led, ledState->on);
        }
    }
    module->blinkTicks++;
}

Int Leds_Module_startup(Int state)
{
    UInt led;
    const GpioPort_Info *gpioPort;
    const GpioPeriph_Info *gpioPeriph;

    for (led = 0; led < module->ledState.length; ++led) {
        gpioPort = GpioPort_getInfo(module->ledState.elem[led].gpioPort);
        gpioPeriph = GpioPeriph_getInfo(gpioPort->periph);

        // Looks like this cannot be initialized in meta domain because
        // the GPIO.h header is not the autogenerated module header.
        gpioHWAttrs[led].port = gpioPeriph->base;
        gpioHWAttrs[led].pin = gpioPort->pin;
        gpioHWAttrs[led].direction = GPIO_OUTPUT;

        GPIO_config[led].hwAttrs = &gpioHWAttrs[led];

        SysCtlPeripheralEnable(gpioPeriph->periph);
        GPIOPinTypeGPIOOutput(gpioPeriph->base, gpioPort->pin);
    }

    GPIO_init(); /* Once GPIO_init is called, GPIO_config cannot be changed */

    for (led = 0; led < module->ledState.length; ++led)
        GPIO_write(led, LED_OFF);

    return Startup_DONE;
}
