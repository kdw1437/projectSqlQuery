MERGE INTO val.OTC_GDS_MSTR tgt
USING (
    SELECT 
        ?GDS_ID AS GDS_ID, 
        ?CNTR_HSTR_NO AS CNTR_HSTR_NO, 
        ?SEQ AS SEQ, 
        ?CNTR_ID AS CNTR_ID,
  		?GDS_TYPE_TP AS GDS_TYPE_TP,
  		?BUY_SELL_TP AS BUY_SELL_TP,
        'HS' AS WRKR_ID, 
        '0.0.0.0' AS WORK_TRIP 
    FROM DUAL
) src
ON (tgt.GDS_ID = src.GDS_ID AND tgt.CNTR_HSTR_NO = src.CNTR_HSTR_NO AND tgt.CNTR_ID = src.CNTR_ID)
WHEN MATCHED THEN
    UPDATE SET tgt.GDS_TYPE_TP = src.GDS_TYPE_TP, tgt.WORK_TIME = SYSDATE
WHEN NOT MATCHED THEN
    INSERT (GDS_ID, CNTR_HSTR_NO, SEQ, CNTR_ID, GDS_TYPE_TP, BUY_SELL_TP, WRKR_ID, WORK_TRIP, WORK_TIME) 
    VALUES (src.GDS_ID, src.CNTR_HSTR_NO, src.SEQ, src.CNTR_ID, src.GDS_TYPE_TP, src.BUY_SELL_TP, src.WRKR_ID, src.WORK_TRIP, SYSDATE)