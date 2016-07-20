//判断用户是否被锁定
//cardid:卡号，aliasname:厂家别名
//return:用户id(f_userid),用户信息id(f_userinfoid)
select f_userid,f_userinfoid 
from t_sellinggas
where f_cardid='{cardid}' and f_aliasname='{aliasname}' and (f_pregas < 0 or f_stair1amount < 0)
