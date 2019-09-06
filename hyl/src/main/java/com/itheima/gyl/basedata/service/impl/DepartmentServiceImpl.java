package com.itheima.gyl.basedata.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itheima.gyl.base.dao.BaseDao;
import com.itheima.gyl.base.service.impl.BaseServiceImpl;
import com.itheima.gyl.basedata.dao.DepartmentDao;
import com.itheima.gyl.basedata.service.DepartmentService;
import com.itheima.gyl.domain.basedata.Department;





@Service("departmentService")
public class DepartmentServiceImpl extends  BaseServiceImpl<Department> implements DepartmentService{
	@Resource(name="departmentDao")
	private DepartmentDao departmentDao;
	@Override
	public BaseDao getBaseDao() {
		// TODO Auto-generated method stub
		return this.departmentDao;
	}	
}
