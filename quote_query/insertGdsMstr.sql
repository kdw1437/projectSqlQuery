INSERT INTO val.OTC_GDS_MSTR (
    GDS_ID, 
    CNTR_HSTR_NO, 
    SEQ, 
    CNTR_ID, 
    GDS_TYPE_TP, 
    BUY_SELL_TP, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?GDS_ID, 
    ?CNTR_HSTR_NO, 
    ?SEQ, 
    ?CNTR_ID, 
    ?GDS_TYPE_TP, 
    ?BUY_SELL_TP, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)