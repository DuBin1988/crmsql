//各地区月明细表查询
//time:查询时间,districtname:小区名称,condition:查询条件
//return：日期（f_deliverydata），居民气量（f_pregas），实际金额（f_preamount），户数（c），用户气量单价（f_stair1price）
select
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11) as f_deliverydata,
	SUM(f_pregas) as f_pregas,f_stair1price,SUM(f_preamount) as f_preamount,
	COUNT(*) as c
from
	t_sellinggas
where
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,7) = '{time}' --输入月份，如‘2016-03’
	and f_districtname like '{districtname}%'{condition}
group by
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11),f_stair1price
order by
	SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11)