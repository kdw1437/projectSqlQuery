MERGE INTO val.otc_vltl_cuvs_data_prtc tgt
USING (
    SELECT 
        ?BASE_DT AS BASE_DT, 
        ?DATA_SET_ID AS DATA_SET_ID, 
        ?DATA_ID AS DATA_ID,
  		?EXPR_VAL AS EXPR_VAL,
        ?VLTL_RT AS VLTL_RT,
  		?SWAP_EXPR_VAL AS SWAP_EXPR_VAL,
  		?BASE_DT AS OCR_DT,
        'MANUALLY_INPUT' AS PGM_ID,  -- Hardcoded value
        'HS' AS WRKR_ID,             -- Hardcoded value
        '0.0.0.0' AS WORK_TRIP       -- Hardcoded value 
        
    FROM DUAL
) src
ON (tgt.BASE_DT = src.BASE_DT AND tgt.DATA_SET_ID = src.DATA_SET_ID AND tgt.DATA_ID = src.DATA_ID AND tgt.EXPR_VAL = src.EXPR_VAL AND tgt.SWAP_EXPR_VAL = src.SWAP_EXPR_VAL)
WHEN MATCHED THEN
    UPDATE SET tgt.VLTL_RT = src.VLTL_RT, tgt.WORK_TIME = SYSDATE
WHEN NOT MATCHED THEN
    INSERT (BASE_DT, DATA_SET_ID, DATA_ID, EXPR_VAL, VLTL_RT, SWAP_EXPR_VAL, OCR_DT, PGM_ID, WRKR_ID, WORK_TRIP, WORK_TIME) 
    VALUES (src.BASE_DT, src.DATA_SET_ID, src.DATA_ID, src.EXPR_VAL, src.VLTL_RT, src.SWAP_EXPR_VAL, src.OCR_DT, src.PGM_ID, src.WRKR_ID, src.WORK_TRIP, SYSDATE)