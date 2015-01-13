var PlatformInfo;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.hw.PlatformInfo');
}

function instance$static$init(obj, idx, params, mod)
{
    obj.info = {
        periph: PlatformInfo['SYSCTL_PERIPH_ADC' + idx],
        base: PlatformInfo['ADC' + idx + '_BASE'],
    };
}
