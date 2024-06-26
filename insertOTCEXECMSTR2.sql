MERGE INTO val.OTC_EXEC_MSTR tgt
USING (
    SELECT 
        ?GDS_ID AS GDS_ID, 
        ?CNTR_HSTR_NO AS CNTR_HSTR_NO, 
        ?LEG_NO AS LEG_NO,
  		?EXEC_TP AS EXEC_TP,
  		?EXEC_GDS_NO AS EXEC_GDS_NO,
  		?SRC_COND_TP AS SRC_COND_TP,
  		?COND_RANGE_TP AS COND_RANGE_TP,
  		?UP_PART_RT AS UP_PART_RT,
  		'HS' AS WRKR_ID, 
        '0.0.0.0' AS WORK_TRIP 
    FROM DUAL
) src
ON (tgt.GDS_ID = src.GDS_ID AND tgt.CNTR_HSTR_NO = src.CNTR_HSTR_NO AND tgt.LEG_NO = src.LEG_NO AND tgt.EXEC_GDS_NO = src.EXEC_GDS_NO)
WHEN MATCHED THEN
    UPDATE SET tgt.WORK_TIME = SYSDATE
WHEN NOT MATCHED THEN
    INSERT (GDS_ID, CNTR_HSTR_NO, LEG_NO, EXEC_TP, EXEC_GDS_NO, SRC_COND_TP, COND_RANGE_TP, UP_PART_RT, WRKR_ID, WORK_TRIP, WORK_TIME) 
    VALUES (src.GDS_ID, src.CNTR_HSTR_NO, src.LEG_NO, src.EXEC_TP, src.EXEC_GDS_NO, src.SRC_COND_TP, src.COND_RANGE_TP, src.UP_PART_RT, src.WRKR_ID, src.WORK_TRIP, SYSDATE)