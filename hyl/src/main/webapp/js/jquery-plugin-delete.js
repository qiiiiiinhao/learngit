(function(jQuery){
	/**
	 * 删除的插件
	 */
	$.deleteObj = function(config){
		/**
		 * config.id代表删除按钮的id的值
		 */
		$("#"+config.id).unbind("click");
		$("#"+config.id).bind("click",function(){
			if($("input[name='"+config.checkboxname+"']:checked").length==0){//表格中的所有的复选框没有一个被选中
				alert("请选中一个再删除");
			}else{
				if(window.confirm("您确认要删除吗?")){
					//被选中的所有的复选框
					var checkedNodes = $("input[name='"+config.checkboxname+"']:checked");
					/**
					 * "1,2,3,4"
					 */
					var checkedStr = "";
					for(var i=0;i<checkedNodes.length;i++){
						if(i==checkedNodes.length-1){
							/**
							 * checkedNodes[i]代表某一个checkbox元素
							 * checkedNodes[i]是一个dom对象
							 */
							checkedStr = checkedStr+$(checkedNodes[i]).attr("value");
						}else{
							checkedStr = checkedStr+$(checkedNodes[i]).attr("value")+",";
						}
					}
					window.location.href = config.url+"?checkedStr="+checkedStr;
				}
			}
		});
		
		/**
		 * 触发最上面的checkbox事件
		 *    如果该checkbox被全部选中，下面的所有的checkbox被选中
		 *    如果该checkbox没有被选中,下面的所有的checkbox不被选中
		 */
		$("#"+config.controlCheckBox).unbind("click");
		$("#"+config.controlCheckBox).bind("click",function(){
			if($(this).attr("checked")){//选中
				$("input[name='"+config.checkboxname+"']").attr("checked",true);
			}else{//未选中
				$("input[name='"+config.checkboxname+"']").attr("checked",false);
			}
		});
		
		/**
		 * 表格中的checkbox事件
		 */
		$("input[name='"+config.checkboxname+"']").unbind("click");
		$("input[name='"+config.checkboxname+"']").bind("click",function(){
			if($("input[name='"+config.checkboxname+"']:not(:checked)").length==0){//表格中的checkbox被全部选中
				$("#"+config.controlCheckBox).attr("checked",true);
			}else{
				$("#"+config.controlCheckBox).attr("checked",false);
			}
		});
	}
	
	$.deleteObjForm = function(){
		$("input[type='submit']").unbind("click");
		$("input[type='submit']").bind("click",function(){
			if(window.confirm("您确认要删除吗?")){
				return true;
			}else{
				return false;//如果返回的是false,则表单不提交
			}
		});
	}
})(jQuery);
