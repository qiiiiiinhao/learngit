package com.itheima.gyl.basedata.test;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;

import com.itheima.gyl.test.utils.SpringUtils;




public class SessionFactoryTest extends SpringUtils{
	@Test
	public void testSessionFactory(){
		context.getBean("sessionFactory");
	}  
	
	@Test
	public void testConnection() throws Exception{
		DataSource dataSource = (DataSource)context.getBean("dataSource");
		System.out.println(dataSource.getConnection().getClass());
	}
	
	@Test
	public void testCountProduct(){
		SessionFactory sessionFactory = (SessionFactory)context.getBean("sessionFactory");
		Session session = sessionFactory.openSession();
		Long count = (Long)session.createQuery("select count(*) from Department").uniqueResult();
		System.out.println(count);
		session.close();
	}
}
