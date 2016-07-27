//小区居民城网是售气情况
//startTime:起始时间，endTime：截止时间
//return:日期（f_deliverydate），小区名称（f_districtname），应收金额（totalCost），实收金额（grossproceeds），户数（c）
select 
  SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11) as f_deliverydate,
  f_districtname, SUM(f_totalcost) as totalCost,
  SUM(f_grossproceeds) as grossproceeds,COUNT(*) as c
from t_sellinggas 
where f_deliverydate>='{startTime}' and f_deliverydate<='{endTime}'
group by SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11),f_districtname