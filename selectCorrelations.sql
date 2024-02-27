SELECT 
	c.BASE_DT AS baseDt,
    c.DATA_SET_ID AS dataSetId,
    c.CRLT_CFCN_MATX_ID AS matrixId,
    c.TH01_DATA_ID AS dataId1,
    c.TH02_DATA_ID AS dataId2,
    c.CRLT_CFCN AS corr
FROM 
    val.OTC_CRLT_CFCN_DATA_PRTC c
WHERE 
    (
        (
            c.TH01_DATA_ID IN (
                SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
                FROM DUAL
                CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
            )
            AND
            c.TH02_DATA_ID IN (
                SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
                FROM DUAL
                CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
            )
        )
        OR
        (
            c.TH02_DATA_ID IN (
                SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
                FROM DUAL
                CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
            )
            AND
            c.TH01_DATA_ID IN (
                SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
                FROM DUAL
                CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
            )
        )
    )
    
    AND c.DATA_SET_ID = NVL(?dataSetId, 'official')
    AND c.BASE_DT = ?baseDt
    AND c.CRLT_CFCN_MATX_ID = NVL(?matrixId, 'CORR')