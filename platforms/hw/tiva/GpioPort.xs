var HwAttrs;
var GpioPeriph;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.hw.tiva.HwAttrs');
    GpioPeriph = xdc.useModule('platforms.hw.tiva.GpioPeriph');
}

function instance$static$init(obj, portLetter, pin, params, mod)
{
    obj.info = {
        // TODO: look through instances and create only one per letter
        periph: GpioPeriph.create(portLetter),
        pin: HwAttrs['GPIO_PIN_' + pin],
    };
}
