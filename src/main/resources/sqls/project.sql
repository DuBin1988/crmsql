// 取所有根项目及其子节点个数
// return: 项目内容, 子节点个数(size)
select p.*, isnull(c.c, 0) size from(
	select * from t_project where f_parentid is null
) p left join (
	// 获取每个节点的子节点个数
	{ sql.call($项目汇总$, {groupName: $f_parentid$}) }
) c on p.id=c.f_parentid
order by p.id desc