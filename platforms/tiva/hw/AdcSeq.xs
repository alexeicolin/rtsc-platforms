var PlatformInfo;

function module$meta$init()
{
    PlatformInfo = xdc.useModule('platforms.tiva.hw.PlatformInfo');
}

function instance$static$init(obj, adcIdx, seqIdx, params, mod)
{
    // Helpful intermediate values
    var ADC_SEQ = PlatformInfo.ADC_O_SSMUX0;
    var ADC_SEQ_STEP = PlatformInfo.ADC_O_SSMUX1 - PlatformInfo.ADC_O_SSMUX0;
    var ADC_SSFIFO = PlatformInfo.ADC_O_SSFIFO0 - PlatformInfo.ADC_O_SSMUX0;

    var adcBase = PlatformInfo['ADC' + adcIdx + '_BASE'];

    var dmaChanNum = PlatformInfo[
                        'UDMA_CHANNEL_NUM_ADC_' + adcIdx + '_' + seqIdx];

    obj.info = {
        dataAddr: adcBase + ADC_SEQ + ADC_SEQ_STEP * seqIdx + ADC_SSFIFO,
        dmaInt: PlatformInfo['ADC_INT_DMA_SS' + seqIdx],
        dmaChanNum: PlatformInfo['UDMA_CHANNEL_ADC_' + adcIdx + '_' + seqIdx],
        dmaChanAssign: PlatformInfo[
                    'UDMA_CH' + dmaChanNum + '_ADC' + adcIdx + '_' + seqIdx],
    };
}
