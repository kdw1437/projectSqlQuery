SELECT
    BASE_DT AS "baseDt",
    DATA_SET_ID AS "dataSetId",
    DATA_ID AS "dataId",
    DVID_DT AS "discreteDividends.date",
    DVIDA AS "discreteDividends.value"
FROM
    val.OTC_DIRT_DVID_FLOW_DATA_PRTC

WHERE 
    DATA_ID IN (
        SELECT REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL)
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(?dataIds, '[^,]+', 1, LEVEL) IS NOT NULL
    )
AND BASE_DT = ?baseDt
AND DATA_SET_ID = NVL(?dataSetId, 'official')
ORDER BY DVID_DT