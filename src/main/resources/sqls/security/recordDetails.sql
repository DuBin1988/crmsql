//查询安检记录详情
//condition:查询条件
//return:重复的取最新的一条安检记录  
select * 
FROM (select * 
	  from T_INSPECTION 
	  where {condition} ) i
join (select MAX(id) ids,f_userid userid 
	  from T_INSPECTION  
	  group by f_userid) n 
on  n.userid = i.f_userid and i.id=n.ids