SELECT 
a.UserID,
a.PayAmount,
a.RecordTime RecordTimeINT  
FROM 
(
	SELECT UserID,PayAmount,RecordTime FROM NewPlatform_Log.RechargePlatformOrder WHERE PayStatus=1 and RecordTime >=  and RecordTime < 
	UNION ALL
	SELECT UserID,PayAmount,RecordTime FROM NewPlatform_Log.RechargePlatformOrder WHERE PayStatus=1 and RecordTime >=  and RecordTime < 
) a 
INNER JOIN 
(
    SELECT UserID,MIN(RecordTime) RecordTime  FROM 
	(
	   SELECT UserID,MIN(RecordTime) RecordTime  FROM NewPlatform_Log.RechargePlatformOrder WHERE PayStatus=1  GROUP BY UserID
	   union all
	   SELECT UserID,MIN(RecordTime) RecordTime  FROM NewPlatform_Log.RechargePlatformOrder WHERE PayStatus=1  GROUP BY UserID
	) tt GROUP BY UserID   HAVING MIN(RecordTime) >=  AND MIN(RecordTime) < 
) b  ON a.UserID = b.UserID and a.RecordTime = b.RecordTime
							
SELECT 
a.UserID,
a.PayAmount,
a.RecordTime RecordTimeINT  
FROM 
(
	SELECT ID,UserID,PayAmount,RecordTime FROM NewPlatform_Log.RechargePlatformOrder20181231235959 WHERE PayStatus=1 and RecordTime >= 1546531200 and RecordTime < 1546617600
	UNION ALL
	SELECT ID,UserID,PayAmount,RecordTime FROM NewPlatform_Log.RechargePlatformOrder20191231235959 WHERE PayStatus=1 and RecordTime >= 1546531200 and RecordTime < 1546617600
) a 
INNER JOIN 
(
    SELECT UserID,MIN(ID) ID  FROM 
		(
			 SELECT UserID,MIN(RecordTime) RecordTime,MIN(ID) ID  FROM NewPlatform_Log.RechargePlatformOrder20181231235959 WHERE PayStatus=1  GROUP BY UserID
			 UNION ALL
			 SELECT UserID,MIN(RecordTime) RecordTime,MIN(ID) ID  FROM NewPlatform_Log.RechargePlatformOrder20191231235959 WHERE PayStatus=1  GROUP BY UserID
		) tt GROUP BY UserID   HAVING MIN(RecordTime) >= 1546531200  AND MIN(RecordTime) < 1546617600
) b  ON a.UserID = b.UserID and a.ID = b.ID							

							
							
