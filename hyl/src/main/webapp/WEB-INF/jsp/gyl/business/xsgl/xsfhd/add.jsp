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
			 //在添加的时候，要弹出一个div框选择商品
			GylUtils.business.add.divProductFrame.divProdctFrameEvent();
			//声明一个事件，弹出的div的确定事件
			GylUtils.business.add.divProductFrame.divProductFrameSureEvent();
			//给行号声明右键事件
			GylUtils.business.add.addHhContextMenu();
			//声明当鼠标移出右键菜单的区域的时候，隐藏右键菜单的事件
			GylUtils.business.add.hideRMenu();
			//给右键菜单的增加菜单声明click事件
			GylUtils.business.add.rMenuClick();
			//给无税单价的input添加一个blur事件
			GylUtils.business.add.wsdjBlurEvent();
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
<s:form action="xsfhdAction_add.action">
<table id="wrap">
	<tr>
    	<td id="rig_top" >
            <div   style="overflow:auto; height:190px; width:1150px;">
            <table class="content" style="font-size:12px;">
                <tr>
                    <td style="color:#00F">单据日期</td>
                    <td class="inp"><input type="text" name="query_zhub.djrq"/></td>
                    <td style="color:#00F">仓库</td>
                    <td class="inp"><input type="text" value="1.00" style="text-align:right" name="query_zhub.ck"/></td>
                    <td style="color:#00F">库管员</td>
                    <td class="inp"><input type="text" value="1.00" style="text-align:right" name="query_zhub.kgy"/></td>
                </tr>
                <tr>
                    <td class="one" style="color:#00F">部门</td>
                    <td class="inp"><input type="text" name="query_zhub.bm"/></td>
                    <td class="one" style="color:#00F">客户</td>
                    <td class="inp"><input type="text" name="query_zhub.kh"/></td>
                </tr>
                <tr>
                    <td style="color:#00F">单据状态</td>
                    <td class="inp"><input type="text" value="1.00" name="query_zhub.status"/></td>
                    <td class="one" style="color:#00F">审批人</td>
                    <td class="inp"><input type="text" name="query_zhub.shr"/></td>
					<td class="one" style="width:66px;">审批日期</td>
                    <td class="inp"><input type="text" id='dhrq' name="query_zhub.shrq"/></td>
                </tr>
				<tr>
					<td class="one" style="color:#00F">制单人</td>
                    <td class="inp"><input type="text" name="query_zhub.zdr"/></td>
					<td class="one" style="width:66px;">制单日期</td>
                    <td class="inp"><input type="text" name="query_zhub.zdrq"/></td>
					<td class="one" style="color:#00F">修改人</td>
                    <td class="inp"><input type="text"  style="background:url(images/search.png) no-repeat 226px center #F6F9FD;" onclick="data()"/></td>
				</tr>
				<tr>
					<td class="one" style="width:66px;">修改日期</td>
                    <td class="inp"><input type="text"/></td>
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
                    <td style="color:#00F;border:1px solid #9EB6CE; border-left:0;"" width="100" field="spbm">商品编码</td>
                    <td class="inp" item="spmc">
                    	<div class="inp_search">
                    		<input type="text" class="bdnone" readonly="readonly" name="xsyddzhibs[0].spmc"/>
                    		<span class="searRR"></span>
                    	</div>
                    	<div id="seek">
                    	 	<div class="seek_con_top">
	                        	<h5>商品信息</h5>
	                            <span class="seek_close" onclick="allclose()"></span>
	                        </div>
	                        <div class="seek_con">
	                        	<div style="overflow:scroll; overflow-x:hidden; height:275px;border:1px solid #898989;width:800px">
	                        		<table cellpadding="0" cellspacing="0">
	                        			<tr class="one">
	                        				<td width="500" item="radio">选择</td>
	                        			 	<td width="500" item="spmc">商品名称</td>
						                    <td width="300" item="xh">商品型号</td>
						                    <td width="300" item="spbm">商品编码</td>
											<td width="300" item="dw">商品单位</td>
											<td width="300" item="shulv">税率</td>
										</tr>
	                        		</table>
	                        	</div>
	                        	<div class="btns">
                                	<button class="btn">确定</button>
                            	</div>
	                        </div>
                    	 </div>
                    </td>
                    <td width="100" field="xh">型号</td>
                    <td width="100" field="dw">单位</td>
                    <td width="100" field="scrq">生产日期</td>
					<td width="100" field="sxrq">失效日期</td>
					<td width="100" field="yfsl">应发数量</td>
					<td width="100" field="sfsl">实发数量</td>
					<td width="100" field="dj">单价</td>
					<td width="100" field="je">金额</td>
					<td width="100" field="fhrq">发货日期</td>
					<td width="200" field="zp">赠品</td>
					<td width="200" field="ytdjh">源头单据号</td>
					<td width="200" field="ythh">源头行号</td>
					<td width="200" field="ytdjh">来源单据号</td>
					<td width="200" field="ythh">来源行号</td>
					<td width="200" field="ljkpsl">累计发货数量</td>
                </tr>
                <tr align="center">
                    <td style="width:30px; text-align:center; background:#E2E2E2;" item='hh'><input type="text" style="width:100%;" readonly="true" name="xsfhdzhibs[0].hh" value="1"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="spbm"><input type="text" style="width:100%;" name="xsfhdzhibs[0].spbm"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="spmc"><input type="text" style="width:100%;" name="xsfhdzhibs[0].spmc"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="xh"><input type="text" style="width:100%;" name="xsfhdzhibs[0].xh"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="dw"><input type="text" style="width:100%;" name="xsfhdzhibs[0].dw"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="scrq"><input type="text" style="width:100%;" name="xsfhdzhibs[0].scrq"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="sxrq"><input type="text" style="width:100%;" name="xsfhdzhibs[0].sxrq"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="yfsl"><input type="text" style="width:100%;" name="xsfhdzhibs[0].yfsl"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="sfsl"><input type="text" style="width:100%;" name="xsfhdzhibs[0].sfsl"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="dj"><input type="text" style="width:100%;" name="xsfhdzhibs[0].dj"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="je"><input type="text" style="width:100%;" name="xsfhdzhibs[0].je"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ckrq"><input type="text" style="width:100%;" name="xsfhdzhibs[0].fhrq"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="zp"><input type="text" style="width:100%;" name="xsfhdzhibs[0].zp"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ytdjh"><input type="text" style="width:100%;" name="xsfhdzhibs[0].ytdjh"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ythh"><input type="text" style="width:100%;" name="xsfhdzhibs[0].ythh"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ytdjh"><input type="text" style="width:100%;" name="xsfhdzhibs[0].lydjh"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ythh"><input type="text" style="width:100%;" name="xsfhdzhibs[0].lyhh"/></td>
                    <td style="border-collapse:collapse;  empty-cells:show;" item="ljkpsl"><input type="text" style="width:100%;" name="xsfhdzhibs[0].ljfhsl"/></td>
                </tr>
                <tr class="other">
                   <td style="border:0"></td>
                </tr>
            </table>
           </div>
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
