#SQL文档

燃气客服系统SQL管理工程，按类型及功能分类


##SQL功能归类：

1. 基本SQL查询
	 * 基本SQL查询
		  - 根据id求项目内容:byId.sql
		  - 单表查询:singleTable.sql
		  - 排序单表查询:singleTable_OrderBy.sql
	 
          
2. 单表查询
     * 收费查询
		  - 判断用户是否被锁定:isLock。sql
		  - 各地区月明细表查询:detailByMonth.sql
		  - 获取缴费总气量:getAlreadBuyGas.sql
		  - 小区居民城网是售气情况:userGas。sql
		  - 根据ID查询收费记录:getBilById.sql
	 * 用户查询
		  - 查询用户基本信息:getUserInfo.sql
		  - 查询用户基本信息:getUserFile.sql
		  - 查找用户数量:getCount.sql
		  - 查询用户抄表记录明细:userHPDetail.sql
		  - 查询用户抄表记录汇总:userHPCount.sql
	 * 抄表查询
		  - 抄表信息汇总:infoHandPlan.sql
		  	  
		         
3. 关联查询
	 * 关联查询
		  - 小区抄表统计(用户、抄表关联):districtHandPlan.sql
		  - 查询欠费记录(用户、抄表关联):getDebts.sql
		  - 有阶梯欠费用户(用户、抄表关联):getOwnInfo.sql.sql
		  - 机表欠费报表查询(用户、抄表、收费关联):machineTable_Owe.sql
		  - 查找用户信息(t_userinfo中f_userid源于子查询信息):getUserInfo.sql
		  - 获取多个用户该时间点前的最后一条抄表记录的本期指数:getCurrentIndex.sql
		  - 产销情况汇总(修文):productMarket.sql
		     
       
4. 测试SQL
	 * 测试用例
		  - 测试用例:text.sql
		  - 根据汇总字段，求子项目总数:项目汇总。sql
		  - 取所有根项目及其子节点个数:project.sql  

	
    