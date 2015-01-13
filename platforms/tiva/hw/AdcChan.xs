var HwAttrs;
var GpioPort;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.tiva.hw.HwAttrs');
    GpioPort = xdc.useModule('platforms.tiva.hw.GpioPort');
}

function instance$static$init(obj, type, idx, params, mod)
{
    var ctlValue, gpioPort;
    if (type == mod.Type_ANALOG) {
        ctlValue = HwAttrs['ADC_CTL_CH' + idx];
        var gpioPortInfo = mod.gpioPorts[idx];
        gpioPort = GpioPort.create(gpioPortInfo.port, gpioPortInfo.pin);
    } else if (type == mod.Type_TEMPERATURE) {
        ctlValue = HwAttrs['ADC_CTL_TS'];
        gpioPort = null;
    }

    obj.info = {
        type: type, // optional (could exclude this from target domain)
        ctlValue: ctlValue,
        gpioPort: gpioPort,
    };
}
