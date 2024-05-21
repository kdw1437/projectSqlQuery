INSERT INTO val.OTC_CNTR_UNAS_PRTC (
    CNTR_ID, 
    CNTR_HSTR_NO, 
    SEQ, 
    UNAS_ID, 
    LEG_NO, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?CNTR_ID, 
    ?CNTR_HSTR_NO, 
    ?SEQ, 
    ?UNAS_ID, 
    ?LEG_NO, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)