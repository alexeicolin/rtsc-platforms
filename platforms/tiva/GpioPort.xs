var PlatformInfo;
var GpioPeriph;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.PlatformInfo');
    GpioPeriph = xdc.useModule('platforms.tiva.GpioPeriph');
}

function instance$static$init(obj, portLetter, pin, params, mod)
{
    obj.info = {
        // TODO: look through instances and create only one per letter
        periph: GpioPeriph.create(portLetter),
        pin: PlatformInfo['GPIO_PIN_' + pin],
    };
}
