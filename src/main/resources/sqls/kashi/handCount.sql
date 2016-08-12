//抄表汇总
//operator:抄表员，startDate:开始日期,endDate：结束日期
//return：f_gasproperties:用气性质，f_stair1price：阶段一单价，lastinputgasnum：上月表底数，lastrecord：本月表底数，oughtamount：本月用量
//        oughtfee: 应收气款,zhye:月初余额,arrears:期末欠款, notax:本月不含税收入,tax:销项税额,
select f_gasproperties,f_stair1price,round(SUM(lastinputgasnum),2) lastinputgasnum,
round(SUM(lastrecord),2) lastrecord,round(SUM(oughtamount),2) oughtamount,
round(SUM(oughtfee),2) oughtfee,round(sum(f_zhye),2) zhye,round((SUM(oughtfee)-sum(f_zhye)),2) arrears,
round((SUM(oughtfee)/1.13),2) notax,round((SUM(oughtfee)-(SUM(oughtfee)/1.13)),2) tax
from t_handplan where f_state='已抄表' and f_operator='{operator}' and lastinputdate BETWEEN '{startDate}' and '{endDate}'
group by f_gasproperties,f_stair1price