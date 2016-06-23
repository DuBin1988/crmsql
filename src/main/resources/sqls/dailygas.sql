//日现金气量核对
//month：月份,districtname:小区名称
//return：日期，居民气量，实际金额，户数，用户气量单价
select 
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11) as f_deliverydata,
	SUM(f_pregas) as f_pregas,SUM(f_preamount) as f_preamount,
	COUNT(*) as c,f_gasprice
from
	t_sellinggas
where 
	f_deliverydate>='2016-0{month}-01' and f_deliverydate<='2016-0{month}-30' and f_districtname like '{districtname}%' 
	and f_usertype = '非民用' 
group by
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11),f_gasprice
order by 
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11)