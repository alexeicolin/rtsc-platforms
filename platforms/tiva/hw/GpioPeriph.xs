var PlatformInfo;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.hw.PlatformInfo');
}

function instance$static$init(obj, portLetter, params, mod)
{
    obj.info = {
        base: PlatformInfo['GPIO_PORT' + portLetter + '_BASE'],
        periph: PlatformInfo['SYSCTL_PERIPH_GPIO' + portLetter],
    };
}
