package com.itheima.gyl.basedata.action;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.itheima.gyl.base.action.BaseAction;
import com.itheima.gyl.basedata.service.DepartmentService;
import com.itheima.gyl.domain.basedata.Department;
import com.itheima.gyl.query.PageResult;
import com.itheima.gyl.query.basedata.DepartmentQuery;
import com.itheima11.gyl.privilege.annotation.PrivilegeInfo;
import com.opensymphony.xwork2.ActionContext;

@Controller("departmentAction")
@Scope("prototype")
public class DepartmentAction extends BaseAction<Department>{
	@Resource(name="departmentService")
	private DepartmentService departmentService;
	private DepartmentQuery baseQuery = new DepartmentQuery();
	
	@PrivilegeInfo(name="部门查询")
	public String showPageResult(){
		baseQuery.setCurrentPage(this.getCurrentPage());
		PageResult<Department> departments = this.departmentService.getPageResult(baseQuery);
		ActionContext.getContext().put("departments", departments);
		return listAction;
	}
	
	public String deleteDepartments(){
		//String[] ids = this.getCheckedStr().split(",");
		this.departmentService.deleteEntriesByIds(this.getIds());
		return action2action;
	}
	
	public String addUI(){
		return addUI;
	}
	
	public String add(){
		Department department = new Department();
		BeanUtils.copyProperties(this.getModel(), department);
		this.departmentService.saveEntry(department);
		return action2action;
	}
	
	public String updateUI(){
		Department department = this.departmentService.getEntryById(this.getModel().getDid());
		ActionContext.getContext().getValueStack().push(department);
		return updateUI;
	}
	
	public String update(){
		Department department = this.departmentService.getEntryById(this.getModel().getDid());
		BeanUtils.copyProperties(this.getModel(), department);
		this.departmentService.updateEntry(department);
		return "chain";
	}
}
