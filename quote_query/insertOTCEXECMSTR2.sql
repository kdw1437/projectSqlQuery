INSERT INTO val.OTC_EXEC_MSTR (
    GDS_ID, 
    CNTR_HSTR_NO, 
    LEG_NO, 
    EXEC_TP, 
    EXEC_GDS_NO, 
    SRC_COND_TP, 
    COND_RANGE_TP, 
    UP_PART_RT, 
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
    ?SRC_COND_TP, 
    ?COND_RANGE_TP, 
    ?UP_PART_RT, 
    'HS', 
    '0.0.0.0', 
    SYSDATE
)