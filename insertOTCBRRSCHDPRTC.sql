MERGE INTO val.OTC_BRR_SCHD_PRTC tgt
USING (
    SELECT 
        ?GDS_ID AS GDS_ID, 
        ?CNTR_HSTR_NO AS CNTR_HSTR_NO, 
        ?LEG_NO AS LEG_NO, 
        ?BRR_TP AS BRR_TP,
  		?BRR_GDS_NO AS BRR_GDS_NO,
  		?SQNC AS SQNC,
  		?OBRA_STRT_DT AS OBRA_STRT_DT,
  		?OBRA_END_DT AS OBRA_END_DT,
  		?BRR_RT AS BRR_RT,
        'HS' AS WRKR_ID, 
        '0.0.0.0' AS WORK_TRIP 
    FROM DUAL
) src
ON (tgt.GDS_ID = src.GDS_ID AND tgt.CNTR_HSTR_NO = src.CNTR_HSTR_NO AND tgt.LEG_NO = src.LEG_NO)
WHEN MATCHED THEN
    UPDATE SET tgt.WORK_TIME = SYSDATE
WHEN NOT MATCHED THEN
    INSERT (GDS_ID, CNTR_HSTR_NO, LEG_NO, BRR_TP, BRR_GDS_NO, SQNC, OBRA_STRT_DT, OBRA_END_DT, BRR_RT, WRKR_ID, WORK_TRIP, WORK_TIME) 
    VALUES (src.GDS_ID, src.CNTR_HSTR_NO, src.LEG_NO, src.BRR_TP, src.BRR_GDS_NO, src.SQNC, src.OBRA_STRT_DT, src.OBRA_END_DT, src.BRR_RT, src.WRKR_ID, src.WORK_TRIP, SYSDATE)