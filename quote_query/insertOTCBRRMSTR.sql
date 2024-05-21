INSERT INTO val.OTC_BRR_MSTR (
    GDS_ID, 
    CNTR_HSTR_NO, 
    LEG_NO, 
    BRR_TP, 
    BRR_GDS_NO, 
    SRC_COND_TP, 
    COND_RANGE_TP, 
    OBRA_PRIC_TYPE_TP, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?GDS_ID, 
    ?CNTR_HSTR_NO, 
    ?LEG_NO, 
    ?BRR_TP, 
    ?BRR_GDS_NO, 
    ?SRC_COND_TP, 
    ?COND_RANGE_TP, 
    ?OBRA_PRIC_TYPE_TP, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)