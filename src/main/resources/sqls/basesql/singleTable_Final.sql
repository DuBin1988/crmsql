//最终单表查询
//items:所需字段,tablename:表名,condition:查询条件,groupitem:分组字段,orderitem:排序的字段
//return：项目内容
select {items}
from {tablename}
where {condition}
group by {groupitem}
order by {orderitem}