//其他补气查询
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate,orderitem:需要排序的字段
//return:次数(c),补气量(f_cmaddgas)
select ISNULL(COUNT(*),0) c,ISNULL(SUM(f_cmaddgas),0) f_cmaddgas
from t_otherfillgas 
where f_parentname5 = '{network}' and f_operator = '{operator}' and f_addgasdate >= '{startDate}' and f_addgasdate <='{endDate}'
group by f_addgastype
