INSERT INTO val.OTC_CNTR_MSTR (
    CNTR_ID, 
    CNTR_HSTR_NO, 
    ISIN_CODE, 
    CNTR_CODE, 
    CNTR_TYPE_TP, 
    GDS_TMPL_TP, 
    DEAL_DT, 
    AVLB_DT, 
    END_DT, 
    BUY_SELL_TP, 
    NMNL_AMT, 
    NMNL_AMT_CRNC_CODE, 
    FV_LEVL_TP, 
    INSD_OTSD_EVLT_TP, 
    BASEP_DTRM_DT, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?CNTR_ID, 
    ?CNTR_HSTR_NO, 
    ?ISIN_CODE, 
    ?CNTR_CODE, 
    ?CNTR_TYPE_TP, 
    ?GDS_TMPL_TP, 
    ?DEAL_DT, 
    ?AVLB_DT, 
    ?END_DT, 
    ?BUY_SELL_TP, 
    ?NMNL_AMT, 
    ?NMNL_AMT_CRNC_CODE, 
    ?FV_LEVL_TP, 
    ?INSD_OTSD_EVLT_TP, 
    ?BASEP_DTRM_DT, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)