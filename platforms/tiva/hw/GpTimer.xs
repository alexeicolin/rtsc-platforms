var PlatformInfo;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.hw.PlatformInfo');
}

function instance$static$init(obj, idx, half, params, mod)
{
    // Currently only one half mode is supported
    obj.info = {
        periph: PlatformInfo['SYSCTL_PERIPH_TIMER' + idx],
        base: PlatformInfo['TIMER' + idx + '_BASE'],
        half: half == mod.Half_A ?
                PlatformInfo['TIMER_A'] : PlatformInfo['TIMER_B'],
        cfg: ((half == mod.Half_A ?
                    PlatformInfo['TIMER_CFG_A_PERIODIC'] :
                    PlatformInfo['TIMER_CFG_B_PERIODIC']) |
                PlatformInfo['TIMER_CFG_SPLIT_PAIR']),
    };
}
