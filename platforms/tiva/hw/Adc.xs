var HwAttrs;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.tiva.hw.HwAttrs');
}

function instance$static$init(obj, idx, params, mod)
{
    obj.info = {
        periph: HwAttrs['SYSCTL_PERIPH_ADC' + idx],
        base: HwAttrs['ADC' + idx + '_BASE'],
    };
}
