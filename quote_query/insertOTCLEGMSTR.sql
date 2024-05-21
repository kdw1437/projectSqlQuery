INSERT INTO val.OTC_LEG_MSTR (
    GDS_ID, 
    CNTR_HSTR_NO, 
    LEG_NO, 
    WRKR_ID, 
    WORK_TRIP, 
    WORK_TIME
)
VALUES (
    ?GDS_ID, 
    ?CNTR_HSTR_NO, 
    ?LEG_NO, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)