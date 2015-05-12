var HwAttrs;
var GpioPort;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.hw.tiva.HwAttrs');
    GpioPort = xdc.useModule('platforms.hw.tiva.GpioPort');
}

function instance$static$init(obj, type, idx, params, mod)
{
    var ctlValue, gpioPort;
    if (type == mod.Type_ANALOG_SINGLE) {
        ctlValue = HwAttrs['ADC_CTL_CH' + idx];
        var gpioPortInfo = mod.gpioPorts[idx];
        gpioPorts = [
            GpioPort.create(gpioPortInfo.port, gpioPortInfo.pin),
            null
        ];
    } else if (type == mod.Type_ANALOG_DIFF) {
        ctlValue = HwAttrs['ADC_CTL_CH' + idx] | HwAttrs['ADC_CTL_D'];
        var posGpioPortInfo = mod.gpioPorts[2 * idx];
        var negGpioPortInfo = mod.gpioPorts[2 * idx + 1];
        gpioPorts = [
            GpioPort.create(posGpioPortInfo.port, posGpioPortInfo.pin),
            GpioPort.create(negGpioPortInfo.port, negGpioPortInfo.pin),
        ];
    } else if (type == mod.Type_TEMPERATURE) {
        ctlValue = HwAttrs['ADC_CTL_TS'];
        gpioPorts = [null, null];
    }

    obj.info = {
        type: type, // optional (could exclude this from target domain)
        ctlValue: ctlValue,
        gpioPorts: gpioPorts,
    };
}
