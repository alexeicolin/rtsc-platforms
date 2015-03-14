var GPIO;
var GpioPort;

function module$meta$init()
{
    GPIO = xdc.useModule('ti.drivers.GPIO');
    GpioPort = xdc.useModule('platforms.hw.tiva.GpioPort');
}

function module$static$init(state, mod)
{
    state.gpioPorts.length = mod.gpioPorts.length;
    for (var i = 0; i < mod.gpioPorts.length; ++i) {
        var gpioPort = mod.gpioPorts[i];
        state.gpioPorts[i] = GpioPort.create(gpioPort.port, gpioPort.pin);
    }
}
