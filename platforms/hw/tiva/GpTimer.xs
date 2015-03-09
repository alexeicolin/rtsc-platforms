var HwAttrs;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.hw.tiva.HwAttrs');
}

function instance$static$init(obj, idx, half, params, mod)
{
    // Currently only one half mode is supported
    obj.info = {
        periph: HwAttrs['SYSCTL_PERIPH_TIMER' + idx],
        base: HwAttrs['TIMER' + idx + '_BASE'],
        half: half == mod.Half_A ?
                HwAttrs['TIMER_A'] : HwAttrs['TIMER_B'],
        cfg: ((half == mod.Half_A ?
                    HwAttrs['TIMER_CFG_A_PERIODIC'] :
                    HwAttrs['TIMER_CFG_B_PERIODIC']) |
                HwAttrs['TIMER_CFG_SPLIT_PAIR']),
    };
}
