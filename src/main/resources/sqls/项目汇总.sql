// 根据汇总字段，求子项目总数。
// groupName: 要汇总的字段
// return: 汇总字段, 总数(c)
select {groupName}, COUNT(*) c 
from t_project
group by {groupName}
