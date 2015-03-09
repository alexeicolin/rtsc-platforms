var HwAttrs;

function module$meta$init()
{
    HwAttrs = xdc.useModule('platforms.hw.tiva.HwAttrs');
}

function instance$static$init(obj, adcIdx, seqIdx, params, mod)
{
    // Helpful intermediate values
    var ADC_SEQ = HwAttrs.ADC_O_SSMUX0;
    var ADC_SEQ_STEP = HwAttrs.ADC_O_SSMUX1 - HwAttrs.ADC_O_SSMUX0;
    var ADC_SSFIFO = HwAttrs.ADC_O_SSFIFO0 - HwAttrs.ADC_O_SSMUX0;

    var adcBase = HwAttrs['ADC' + adcIdx + '_BASE'];

    var dmaChanNum = HwAttrs[
                        'UDMA_CHANNEL_NUM_ADC_' + adcIdx + '_' + seqIdx];

    obj.info = {
        dataAddr: adcBase + ADC_SEQ + ADC_SEQ_STEP * seqIdx + ADC_SSFIFO,
        dmaInt: HwAttrs['ADC_INT_DMA_SS' + seqIdx],
        dmaChanNum: HwAttrs['UDMA_CHANNEL_ADC_' + adcIdx + '_' + seqIdx],
        dmaChanAssign: HwAttrs[
                    'UDMA_CH' + dmaChanNum + '_ADC' + adcIdx + '_' + seqIdx],
    };
}
