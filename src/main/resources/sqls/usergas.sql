//小区居民城网是售气情况
//startTime:起始时间，endTime：截止时间，districtName：小区名称
//return:日期，小区名称，应收金额，实收金额，户数
select 
  SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11) as f_deliverydate,
  f_districtname, SUM(f_totalcost) as totalCost,
  SUM(f_grossproceeds) as grossproceeds,COUNT(*) as c
from t_sellinggas 
where f_deliverydate>='{startTime}' and f_deliverydate<='{endTime}'
group by SUBSTRING(CONVERT(varchar,f_deliverydate,120),1,11),f_districtname
