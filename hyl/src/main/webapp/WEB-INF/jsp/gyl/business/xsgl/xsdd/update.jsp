<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/gyl/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<!--
    jquery日期样式的导入
-->
<link rel="stylesheet" href="js/jquery.datepick.css" type="text/css">
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript" src="js/jquery.datepick-zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$("#wrap").data("url","xsddAction_showXsdd.action?query_zhib.xsddzhubid=");
			//addEvent_Page();
			//给主表和子表的td添加click事件
			GylUtils.business.update.initEvent();
			//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
			$('#dhrq').datepick({dateFormat: 'yy-mm-dd'}); 
			$('#sxrq').datepick({dateFormat: 'yy-mm-dd'}); 
			
	});
	
	$(function(){
		$('.tab li').mouseover(function(){
			var num = $(this).index()-1;
			$(this).addClass('current').siblings().removeClass();
			$('this:eq(num)').remove('span');
		})
	})
	$(function(){
		$('li').mouseover(function(){
			$(this).addClass('current').siblings().removeClass('current');
		})
	})
	function data(){
		window.open("customer.html",100,200);
	}
</script>
</head>
<body>
<s:form action="xsddAction_showXsddByDDH.action">
<table id="wrap">
	<td id="rig_top" >
            <div   style="overflow:auto; height:190px; width:1150px;">
            <table class="content" style="font-size:12px;">
                <tr>
                    <td class="one" style="color:#00F;">单据号</td>
                    <td class="inp"><s:textfield name="query_zhub.ddh"/></td>
                </tr>
                <tr>
                	<td colspan="5"></td>
                    <td height="40" align="center"><input type="submit"  value="查询" class="search"/></td>
                </tr>
            </table>
           </div>
	</td>
	<tr>
    	<td id="rig_top" >
            <div   style="overflow:auto; height:190px;">
            <table cellspacing="0" cellpadding="0" id="maintain-top" align="center"  width="2000"  style="font-size:12px;">
                <tr>
                    <td class="one" style="width:66px;">订货日期</td>
                    <td class="one">失效日期</td>
                    <td class="one">客户名称</td>
                    <td class="one">整单扣率</td>
                    <td class="one" style="color:#00F">销售部门</td>
                    <td class="one" style="color:#00F">业务员</td>
                    <td class="one">开票单位</td>
                    <td class="one">收货地区</td>
                    <td class="one">收货地址</td>
                    <td class="one" style="width:66px;">整单税价合计</td>
                    <td class="one" style="width:66px;">收现款金额</td>
                </tr>
                <tr>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="dhrq_zhu"><s:property value="query_zhub.dhrq"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="sxrq_zhu"><s:property value="query_zhub.sxrq"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="khmc_zhu"><s:property value="query_zhub.khmc"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="zdkl_zhu"><s:property value="query_zhub.zdkl"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="xsbm_zhu"><s:property value="query_zhub.xsbm"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="ywy_zhu"><s:property value="query_zhub.ywy"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="kpdw_zhu"><s:property value="query_zhub.kpdw"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="shdq_zhu"><s:property value="query_zhub.shdq"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="shdz_zhu"><s:property value="query_zhub.shdz"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="zdsjhj_zhu"><s:property value="query_zhub.zdsjhj"/></td>
				   <td style="border-collapse:collapse;  empty-cells:show;" item="sxkje_zhu"><s:property value="query_zhub.sxkje"/></td>
                </tr>
            </table>
           </div>
		</td>
    </tr>
    <tr>
    	<td id="right_center" >
           <div  style="height:213px; width:1150px; overflow:auto;">
            <table cellspacing="0" cellpadding="0"  id="maintain-right"  style="font-size:12px;">
                <tr class="two" align="center">
                    <td width="50" field="hh">行号</td>
                    <td width="100" field="spbm">商品编码</td>
                    <td width="200" field="spmc">商品名称</td>
                    <td width="100" field="xh">型号</td>
                    <td width="100" field="dw">单位</td>
                    <td width="100" field="sl">数量</td>
                    <td width="100" field="shulv">税率</td>
                    <td width="100" field="dpzk">单品扣率</td>
					<td width="100" field="wsdj">无税单价</td>
					<td width="100" field="hsdj">含税单价</td>
					<td width="100" field="wsje">无税金额</td>
					<td width="100" field="hsje">含税金额</td>
					<td width="100" field="se">税额</td>
					<td width="200" field="zke">折扣额</td>
					<td width="200" field="pc">行状态</td>
					<td width="200" field="gs">公司</td>
					<td width="200" field="fhck">发货仓库</td>
					<td width="200" field="shdw">收货单位</td>
					<td width="150" field="jhfhrq">计划发货日期</td>
					<td width="150" field="yqshrq">要求收货日期</td>
					<td width="150" field="hh">行状态</td>
                </tr>
                <s:if test="#pageResult_zhib!=null">
                	<s:iterator value="#pageResult_zhib.rows">
		                <tr align="center">
		                    <td style="border-collapse:collapse;  empty-cells:show;" item="hh_zhi"><s:property value="hh"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="spbm_zhi"><s:property value="spbm"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="spmc_zhi"><s:property value="spmc"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="xh_zhi"><s:property value="xh"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="dw_zhi"><s:property value="dw"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="sl_zhi"><s:property value="sl"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="shulv_zhi"><s:property value="shulv"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="dpkl_zhi"><s:property value="dpkl"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="wsdj_zhi"><s:property value="wsdj"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="hsdj_zhi"><s:property value="hsdj"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="wsje_zhi"><s:property value="wsje"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="hsje_zhi"><s:property value="hsje"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="se_zhi"><s:property value="se"/></td>
                   <td style="border-collapse:collapse;  empty-cells:show;" item="zke_zhi"><s:property value="zke"/></td>
		         	<td style="border-collapse:collapse;  empty-cells:show;" item="hstatus_zhi">
		         	<s:if test="hstatus==2">
		         		行关闭
		         	</s:if>
		         	<s:elseif test="hstatus==1">
		         		没有关闭
		         	</s:elseif>
		         	</td>
		         </tr>
	                </s:iterator>
                </s:if>
            </table>
           </div>
    	</td>
    </tr>
    <tr>
    	<td id="right-bot">
            <table style="font-size:12px;">
                <tr>
                    <td class="bot_1" style="color:#00F">制单人</td>
                    <td class="inp_1"><s:textfield name="query_zhub.zdr" cssClass="current"></s:textfield></td>
                    <td class="bot_1" style="color:#00F">修订人</td>
                    <td class="inp_1"><s:textfield name="query_zhub.xgr" cssClass="current"></s:textfield></td>
                    <td class="bot_1">审批人</td>
                    <td class="inp_1"><s:textfield name="query_zhub.spr" cssClass="current"></s:textfield></td>
                    <td  width="77px">审批日期</td>
                    <td class="inp_1"><s:textfield name="query_zhub.spsj"></s:textfield></td>
                </tr>
                <tr>
                    <td>制单时间</td>
                    <td class="inp_2"><s:textfield name="query_zhub.zdsj"></s:textfield></td>
                    <td>修订时间</td>
                    <td class="inp_2"><s:textfield name="query_zhub.xgsj"></s:textfield></td>
                    <td>审批时间</td>
                    <td class="inp_2"><s:textfield name="query_zhub.spsj"></s:textfield></td>
                </tr>
            </table>
        </td>
    </tr>
     <tr class="save">
       <td height="30" align="right" style="padding-right"><input type="submit" value="保存" class="search"/></td>
     </tr>
</table>
</s:form>
<ul id="menu" style="position:absolute;display:none;">
   <li id="addRow">增行</li>
   <li id="deleteRow">删行</li>
 </ul>
</body>
</html>
