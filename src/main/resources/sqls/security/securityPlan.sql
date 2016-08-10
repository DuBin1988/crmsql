//查询某个时间段的安检计划 
//issued: 是否下发,startDate:开始换表日期,endDate:结束日期,name:安检员
//return: id:安检id,f_name:安检员,f_issued:是否下发,f_date:安检日期,f_enddate:结束日期
select id,f_name,f_issued,f_date,f_enddate 
from T_CHECKPLAN
where f_issued='{issued}' and f_date >='{startDate}' and f_date<='{endDate}' and  f_name='{name}'
order by id