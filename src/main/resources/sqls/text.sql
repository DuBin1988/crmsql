SELECT * FROM
	(
	SELECT DATEPART(year,DATEADD(year,{e},f_last_check_date)) AS f_plan_year,
	DATEPART(month,DATEADD(month,{e}, f_last_check_date)) AS f_plan_month,
	t_userfile.f_checker,f_user_name,f_user_id,f_card_id,f_street,f_residential_area,
	f_building,f_unit,f_floor,f_room,f_address,t_userfile.f_remark,t_userfile.id
		FROM t_check_plan 
		INNER JOIN t_userfile ON t_check_plan.id = t_userfile.id
	) u
	WHERE u.f_plan_year='{year}';