SELECT

    DateTime(zAsset.ZDATECREATED + 978307200,'UNIXEPOCH')
        AS 'Media Created',

    DateTime(zAsset.ZADDEDDATE + 978307200,'UNIXEPOCH')
        AS 'Added To Photos Library',

    DateTime(zAsset.ZMODIFICATIONDATE + 978307200,'UNIXEPOCH')
        AS 'Modified',

    DateTime(zAsset.ZLASTSHAREDDATE + 978307200,'UNIXEPOCH')
        AS 'Last Shared',

    DateTime(zAsset.ZTRASHEDDATE + 978307200,'UNIXEPOCH')
        AS 'Trashed',

    zAddAssetAttr.ZEXIFTIMESTAMPSTRING
        AS 'EXIF Timestamp',

    zAddAssetAttr.ZTIMEZONENAME
        AS 'Time Zone',

    zAsset.ZDIRECTORY
        AS 'Directory',

    zAsset.ZFILENAME
        AS 'Current Filename',

    zAddAssetAttr.ZORIGINALFILENAME
        AS 'Original Filename',

    zAddAssetAttr.ZIMPORTEDBYBUNDLEIDENTIFIER
    AS 'Imported By Bundle ID',

CASE
    WHEN zAddAssetAttr.ZIMPORTEDBYDISPLAYNAME = 'Cámara' THEN 'Camera'
    WHEN zAddAssetAttr.ZIMPORTEDBYDISPLAYNAME = 'Mensajes' THEN 'Messages'
    ELSE zAddAssetAttr.ZIMPORTEDBYDISPLAYNAME
END AS 'Imported By App',

    CASE zAsset.ZHIDDEN
        WHEN 0 THEN 'Not Hidden'
        WHEN 1 THEN 'Hidden'
        ELSE 'Unknown'
    END AS 'Hidden Status',

    CASE zAsset.ZTRASHEDSTATE
        WHEN 0 THEN 'Not Trashed'
        WHEN 1 THEN 'Recently Deleted'
        ELSE 'Unknown'
    END AS 'Trash Status',

    zAsset.ZDELETEREASON
        AS 'Delete Reason',

    zExt.ZCAMERAMAKE
        AS 'Camera Make',

    zExt.ZCAMERAMODEL
        AS 'Camera Model',

    zExt.ZLENSMODEL
        AS 'Lens Model',

    zAsset.ZUUID
        AS 'Asset UUID',

    zAsset.Z_PK
        AS 'Asset PK'

FROM ZASSET zAsset

LEFT JOIN ZADDITIONALASSETATTRIBUTES zAddAssetAttr
    ON zAddAssetAttr.Z_PK = zAsset.ZADDITIONALATTRIBUTES

LEFT JOIN ZEXTENDEDATTRIBUTES zExt
    ON zExt.ZASSET = zAsset.Z_PK	

ORDER BY zAsset.ZDATECREATED;