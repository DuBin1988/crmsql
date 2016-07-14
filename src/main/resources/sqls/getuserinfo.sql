//查找用户信息
//condition:查询条件
//return:参见t_userinfo
select *
from t_userinfo
where f_userid = (select f_userinfoid
				  from t_userfiles
				  where{condition})