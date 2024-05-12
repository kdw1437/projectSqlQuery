MERGE INTO val.otc_errt_curv_data_prtc tgt
USING (
    SELECT 
        ?BASE_DT AS BASE_DT, 
        ?DATA_SET_ID AS DATA_SET_ID, 
        ?DATA_ID AS DATA_ID,
  		?EXPR_VAL AS EXPR_VAL,
        ?ERRT AS ERRT,
  		?RISK_FCTR_CODE AS RISK_FCTR_CODE,
  		?BASE_DT AS OCR_DT,
        'MANUALLY_INPUT' AS PGM_ID,  -- Hardcoded value
        'HS' AS WRKR_ID,             -- Hardcoded value
        '0.0.0.0' AS WORK_TRIP       -- Hardcoded value 
        
    FROM DUAL
) src
ON (tgt.BASE_DT = src.BASE_DT AND tgt.DATA_SET_ID = src.DATA_SET_ID AND tgt.DATA_ID = src.DATA_ID AND tgt.EXPR_VAL = src.EXPR_VAL)
WHEN MATCHED THEN
    UPDATE SET tgt.ERRT = src.ERRT, tgt.WORK_TIME = SYSDATE
WHEN NOT MATCHED THEN
    INSERT (BASE_DT, DATA_SET_ID, DATA_ID, EXPR_VAL, ERRT, RISK_FCTR_CODE, OCR_DT, PGM_ID, WRKR_ID, WORK_TRIP, WORK_TIME) 
    VALUES (src.BASE_DT, src.DATA_SET_ID, src.DATA_ID, src.EXPR_VAL, src.ERRT, src.RISK_FCTR_CODE, src.OCR_DT, src.PGM_ID, src.WRKR_ID, src.WORK_TRIP, SYSDATE)