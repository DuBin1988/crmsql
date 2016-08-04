//汇总单表查询
//tablename:表名,condition:查询条件,orderitem:需要排序的字段
//return：项目内容
select COUNT(*) c
from {tablename}
where {condition}
order by {orderitem}