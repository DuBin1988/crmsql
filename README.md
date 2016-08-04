# crmsql

对燃气整体客服系统的所有sql进行管理。

## sql语句配置

resources下的sql.xml可以对所有sql语句进行统一配置。内容如下：
```xml
<cfg>
	<sql alias='test' path='test.sql'/>
	<sql alias='查询缴费汇总' path='收费/收费汇总.sql'/>
</cfg>
```

- alias: sql语句名称
- path: sql语句存放路径，所有sql语句都存放在sqls文件夹下，这里的路径为相对路径，开头不能加'/'

## sql语句书写

1. 只支持单一sql语句。
2. sql语句支持模块处理，sql语句可以进行复合，例如：

 基本sql，名称为'基本sql'，有一个汇总参数
```
select {groupName}, count(*) c
from t_project
group by {groupName}
```

 复合sql
```
select * from (
  { sql.call($基本sql$, {groupName: $f_name$}) }
) t
```

调用sql.call函数后，将把汇总部分的sql字符串插入到调用部分，这样就实现了sql语句重用。

## sql语句测试

1. 要测试sql语句，先启动后台服务，然后运行test里的测试用例，对sql语句进行测试。
2. 每个sql语句的测试用例只能按英文命名。

## sql语句说明

- sql语句的整体说明在配置文件里，以注释方式进行。如下：

```
<!-- 项目查询测试 -->
<sql alias='项目查询' path='project.sql'/>
```

- 每个sql语句的具体使用说明，在sql语句文件的头部，包括参数说明，执行结果说明。如下：

```
// 根据汇总字段，求总数。
// groupName: 要汇总的字段
// return: 汇总字段, 总数(c)
```

  * 首先说明这个sql的作用
  * 然后列出每个参数的说明
  * 最后说明返回结果集内容，按 `汉字注释(字段名称)` 方式书写。

## sql语句使用说明

1. 每次按照公司需求写出相应sql，之后上传，使用时可直接使用；
2. 如所需特定sql不符合当前要求，可在basesql中查找相应sql模板进行合适修改。

## 版本发布

发布前，修改build.gradle中版本号，用下列命令发布版本：
```
gradle release
```
