package com.itheima.gyl.basedata.test;

import org.junit.Test;

import com.itheima.gyl.base.dao.BaseDao;
import com.itheima.gyl.query.basedata.DepartmentQuery;
import com.itheima.gyl.test.utils.SpringUtils;



public class BaseDaoTest extends SpringUtils{
	@Test
	public void testBaseDao_Count(){
		BaseDao baseDao = (BaseDao)context.getBean("baseDao");
		DepartmentQuery baseQuery = new DepartmentQuery();
		baseQuery.setName("44");
		int count = baseDao.getCount(baseQuery);
		System.out.println(count);
	}
}
   