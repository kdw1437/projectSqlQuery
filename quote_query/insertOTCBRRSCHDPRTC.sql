INSERT INTO val.OTC_BRR_SCHD_PRTC (
    GDS_ID, 
    CNTR_HSTR_NO, 
    LEG_NO, 
    BRR_TP, 
    BRR_GDS_NO, 
    SQNC, 
    OBRA_STRT_DT, 
    OBRA_END_DT, 
    BRR_RT, 
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
    ?SQNC, 
    ?OBRA_STRT_DT, 
    ?OBRA_END_DT, 
    ?BRR_RT, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)