SELECT A.BASE_DT AS "baseDt",
	   A.DATA_SET_ID AS "dataSetId",
	   A.DATA_ID AS "dataId",
	   NULLIF(B.CRNC_CODE, NULL) AS "currency",
       NULLIF(B.RELT_CRNC_CODE, NULL) AS "baseCurrency",
       A.CLOSE_PRIC/NVL(B.CRNC_UNIT_AMT, 1) AS "price"
  FROM VAL.OTC_PRIC_DATA_PRTC A
  	LEFT JOIN VAL.OTC_UNAS_MSTR B
  	ON B.UNAS_ID = A.DATA_ID
 where 1=1
AND A.DATA_ID IN (
    SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
    FROM DUAL
    CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
)
 AND A.BASE_DT = ?baseDt
 AND A.DATA_SET_ID = NVL(?dataSetId, 'official')