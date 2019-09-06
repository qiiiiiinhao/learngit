var role_privilege = {
    /**
     * 数据
     */
    data: {
        role: {
            name: '',
            rid: ''
        },
        checkedStr: '',//被选中的权限树上的复选框的id
        zTreePlugin: ''
    },
    /**
     * 存放操作
     */
    opt: {
        /**
         * 关于div的操作
         */
        divOpt: {
            /*
             * 显示被隐藏的div
             */
            showDiv: function(){
                $("div:hidden").show();
            }
        },
        /**
         * 关于角色的操作
         */
        roleOpt: {
            showRoleName: function(){
                $("#roleImage").text("角色:" + role_privilege.data.role.name);
            }
        },
        /**
         * 关于权限树
         */
        privilegeTree: {
            setting: {
                isSimpleData: true,
                treeNodeKey: "id",
                treeNodeParentKey: "pid",
                showLine: true,
                root: {
                    isRoot: true,
                    nodes: []
                },
                checkable: true,
                callback: {
                    change: function(){
                        if (role_privilege.opt.privilegeTree.isAllCheckedOnPrivilegeTree()) {//全部被选中
                            //设置全选复选框的状态为选中
                            $("#allchecked").attr("checked", true);
                        }
                        else {
                            $("#allchecked").attr("checked", false);
                        }
                    }
                }
            },
            loadPrivilegeTree: function(){
                /**
                 * 第三个参数为回调函数
                 *    该回调函数是由服务器端触发的，并且是在readyState的值为4,status的值为200的情况下触发的
                 * @param {Object} data
                 */
                $.post("privilegeAction_showPrivilegeTree.action", {
					rid:role_privilege.data.role.rid
				}, function(data){
                    role_privilege.data.zTreePlugin = $("#privilegeTree").zTree(role_privilege.opt.privilegeTree.setting, data);
                    /**
                     * 设置显示loading，隐藏权限树
                     */
                    $("#loading").hide();
                    $("#privilegeTree").show();
                    /**
                     * 设置全选复选框初始化的状态值
                     */
                    if (role_privilege.opt.privilegeTree.isAllCheckedOnPrivilegeTree()) {//全部被选中
                        //设置全选复选框的状态为选中
                        $("#allchecked").attr("checked", true);
                    }
                    else {
                        $("#allchecked").attr("checked", false);
                    }
					//设置全选复选框为可用
					$("#allchecked").attr("disabled","");
                });
            },
            /**
             * 判断权限树上的复选框是否被全部选中
             */
            isAllCheckedOnPrivilegeTree: function(){
                var array = role_privilege.data.zTreePlugin.getCheckedNodes(false);
                if (array.length == 0) {//说明全部被选中
                    return true;
                }
                else {//没有被全部选中
                    return false;
                }
            },
			/**
			 * 建立角色与权限之间的关系
			 */
			savePrivilege:function(){
				//得到被选中的权限
				var checkedNodes = role_privilege.data.zTreePlugin.getCheckedNodes(true);
				var checkedStr = "";
				for(var i=0;i<checkedNodes.length;i++){
					if(i==checkedNodes.length-1){
						checkedStr = checkedStr + checkedNodes[i].id;
					}else{
						checkedStr = checkedStr + checkedNodes[i].id+",";
					}
				}
				var parameter = {
					rid:role_privilege.data.role.rid,
					checkedStr:checkedStr
				};
				$.post("privilegeAction_savePrivilege.action",parameter,function(data){
					alert("保存成功");
				});
			}
        }
    },
    /**
     * 初始化
     */
    init: {
        //初始化数据
        initData: function(){
            var name = $(this).parent().siblings("td:first").text();
            var rid = $(this).parent().siblings("input[type='hidden']").attr("value");
            role_privilege.data.role.name = name;
            role_privilege.data.role.rid = rid;
        },
        //初始化事件
        initEvent: function(){
            /**
             * 给设置权限添加click事件
             */
            $("a").each(function(){
                if ($(this).text() == "设置权限") {
                    $(this).css("cursor", "pointer");
                    $(this).unbind("click");
                    $(this).bind("click", function(){
                        /**
                         * 1、显示被隐藏的div
                         * 2、加载权限树
                         * 3、对角色原来有的权限进行回显
                         */
                        //显示div
                        role_privilege.opt.divOpt.showDiv();
                        //调用initData方法给role的name和rid赋值
                        role_privilege.init.initData.call(this);
                        //动态显示角色名称
                        role_privilege.opt.roleOpt.showRoleName();
						//设置全选复选框为不可用
						$("#allchecked").attr("disabled","disabled");
                        /**
                         * 设置显示loading，隐藏权限树
                         */
                        $("#loading").show();
                        $("#privilegeTree").hide();
                        //加载权限树
                        role_privilege.opt.privilegeTree.loadPrivilegeTree();
                    });
                }
            });
            
            /**
             * 全选复选框的事件
             */
            $("#allchecked").unbind("change");
            $("#allchecked").bind("change", function(){
                if ($(this).attr("checked")) {//被选中
                    role_privilege.data.zTreePlugin.checkAllNodes(true);
                }
                else {//未被选中
                    role_privilege.data.zTreePlugin.checkAllNodes(false);
                }
            });
			
			/**
			 * 给保存按钮添加一个click事件
			 */
			$("#savePrivilege").unbind("click");
			$("#savePrivilege").bind("click",function(){
				role_privilege.opt.privilegeTree.savePrivilege();
			});
        }
    }
};

$().ready(function(){
    role_privilege.init.initEvent();
});
