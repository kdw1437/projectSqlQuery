SELECT BASE_DT AS "baseDt",
	   DATA_SET_ID AS "dataSetId",
	   DATA_ID AS "dataId",
	   CONT_DVIDRT AS "yield"
FROM VAL.OTC_CONT_DVIDRT_DATA_PRTC
WHERE 
    DATA_ID IN (
        SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
    )
AND BASE_DT = ?baseDt
AND DATA_SET_ID = NVL(?dataSetId, 'official')