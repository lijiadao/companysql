	SELECT 
	UserID,
	UserType,
	GameTypeID,
	SUM(CASE WHEN (r5.FirstLevelType IN (10,11,12,13,14) OR r5.BusinessType=1403001) AND m1.ItemID=10000  THEN m1.GainCount*IFNULL(r4.cost,1) ELSE 0 END)  Profit,
	IFNULL(SUM(CASE WHEN r5.FirstLevelType=10 AND m1.ItemID=10000 THEN m1.GainCount*IFNULL(r4.cost,1) ELSE 0 END), 0) AS WinOrLose
	FROM UserTreasureChange m1
	INNER JOIN ConfigureDB.Configure_PlatformNewProperty AS r4 ON m1.ItemID=r4.ItemID AND r4.CustomType NOT IN(30,40,60)
	INNER JOIN ConfigureDB.Configure_PlatformBusinessType AS r5 ON m1.BusinessType = r5.BusinessType
	GROUP BY UserID,UserType,GameTypeID