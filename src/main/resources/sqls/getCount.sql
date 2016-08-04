//查找用户数量
//userinfoid:用户编号,orderitem:需要排序的字段
//return：用户数量(c)
select COUNT(*) c  
from t_userfiles 
where f_gasmeterstyle='机表' and f_userinfoid='{userinfoid}'
order by {orderitem}