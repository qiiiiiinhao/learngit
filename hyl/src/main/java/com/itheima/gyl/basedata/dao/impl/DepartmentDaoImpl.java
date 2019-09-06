package com.itheima.gyl.basedata.dao.impl;

import org.springframework.stereotype.Repository;

import com.itheima.gyl.base.dao.impl.BaseDaoImpl;
import com.itheima.gyl.basedata.dao.DepartmentDao;
import com.itheima.gyl.domain.basedata.Department;



@Repository("departmentDao")
public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements DepartmentDao{

}
