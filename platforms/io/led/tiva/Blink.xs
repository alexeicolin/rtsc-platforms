var Clock;

function module$meta$init()
{
    Clock = xdc.useModule('ti.sysbios.knl.Clock');
    Led = xdc.useModule('platforms.io.led.tiva.Led');
}

function module$static$init(state, mod)
{
    var blinkClockObj = Clock.create('&Blink_blinkTick', 1);
    blinkClockObj.period = msecToClockTicks(mod.blinkTickPeriodMs);
    blinkClockObj.startFlag = true;

    state.blinkTicks = 0;
    state.ledState.length = Led.gpioPorts.length;
    for (var i = 0; i < Led.gpioPorts.length; ++i) {
        state.ledState[i] =
            {
             on: false,
             blinkRate: 0,
            };
    }
}

function msecToClockTicks(ms)
{
    var usPerTick = Clock.tickPeriod;
    return (ms * 1000) / usPerTick;
}
