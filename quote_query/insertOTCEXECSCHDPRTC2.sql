INSERT INTO val.OTC_EXEC_SCHD_PRTC (
    GDS_ID, 
    CNTR_HSTR_NO, 
    LEG_NO, 
    EXEC_TP, 
    EXEC_GDS_NO, 
    SQNC, 
    EVLT_DT, 
    ACTP_RT, 
    SETL_DT, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?GDS_ID, 
    ?CNTR_HSTR_NO, 
    ?LEG_NO, 
    ?EXEC_TP, 
    ?EXEC_GDS_NO, 
    ?SQNC, 
    ?EVLT_DT, 
    ?ACTP_RT, 
    ?SETL_DT, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)