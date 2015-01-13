var HwAttrs;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.tiva.hw.HwAttrs');
}

function instance$static$init(obj, portLetter, params, mod)
{
    obj.info = {
        base: HwAttrs['GPIO_PORT' + portLetter + '_BASE'],
        periph: HwAttrs['SYSCTL_PERIPH_GPIO' + portLetter],
    };
}
