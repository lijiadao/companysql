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
							
							

							
							