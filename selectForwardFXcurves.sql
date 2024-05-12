SELECT
    BASE_DT AS "baseDt",
    DATA_SET_ID AS "dataSetId",
    DATA_ID AS "dataId",
    EXPR_VAL AS "yields.tenor",
    ERRT AS "yields.rate"
FROM
    val.OTC_ERRT_CURV_DATA_PRTC

WHERE 
    DATA_ID IN (
        SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
    )
AND BASE_DT = ?baseDt
AND DATA_SET_ID = NVL(?dataSetId, 'official')
ORDER BY EXPR_VAL