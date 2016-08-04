//查询用户基本信息
//cardid:卡号，aliasname:厂家别名,fengongsinum:分公司数量,orderitem:需要排序的字段
//return:项目内容
select * 
from t_userfiles
where f_cardid='{cardid}' and f_aliasname='{aliasname}' and f_fengongsinum = '{fengongsinum}' and f_gasmeterstyle='卡表'
order by {orderitem}