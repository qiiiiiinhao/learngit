package com.itheima.gyl.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.hibernate.metadata.ClassMetadata;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.itheima.gyl.base.dao.BaseDao;
import com.itheima.gyl.query.BaseQuery;
import com.itheima.gyl.query.PageResult;


import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;


@Repository(value="baseDao")
public class BaseDaoImpl<T> implements BaseDao<T>{
	private final Class classt;
	/**
	 * 把泛型的参数提取出来的过程放入到构造函数中写，因为
	 * 当子类创建对象的时候，直接调用父类的构造函数
	 */
	public BaseDaoImpl(){
		/**
		 * this代表子类
		 * this.getClass().getGenericSuperclass()就是父类:BaseDaoImpl<T> 泛型
		 * 如果不带T,this.getClass().getGenericSuperclass()返回的是class类型，而不是ParameterizedType
		 * spring(2.x和3.x)容器不支持带泛型的创建对象
		 */
		ParameterizedType type = (ParameterizedType)this.getClass().getGenericSuperclass();
		//得到t的实现类型
		this.classt = (Class)type.getActualTypeArguments()[0];
	}
	@Resource(name="hibernateTemplate")
	public HibernateTemplate hibernateTemplate;

	@Override
	public PageResult<T> findPageResult(final BaseQuery baseQuery) {
//		PageResult<T> pageResult = new PageResult<T>(baseQuery.getCurrentPage(),baseQuery.getPageSize());
//		return null;
		return null;
	}

	@Override
	public Collection<T> findEntry() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveEntry(T t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateEntry(T t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntriesByIDS(Serializable[] ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEntry(Serializable id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public T getEntryById(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<T> getEntriesByIds(Serializable[] ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(final BaseQuery baseQuery) {
		return this.hibernateTemplate.execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				StringBuffer stringBuffer = new StringBuffer();
				stringBuffer.append("select count(*) from "+classt.getSimpleName());
				stringBuffer.append(" where 1=1 ");
				
				//获取所有的查询条件
				Map<String, Object> keyValues = baseQuery.buildWhere();
				
				/**
				 * 拼接where条件的过程
				 */
				for (Entry<String, Object> entry : keyValues.entrySet()) {
					stringBuffer.append("and "+entry.getKey()+"=:"+entry.getKey());
				}
				
				System.out.println("hql语句:"+stringBuffer.toString());
				
				Query query = session.createQuery(stringBuffer.toString());//存放一个hql语句
				
				/**
				 * 把where条件中的参数传递值的过程
				 */
				for (Entry<String, Object> entry : keyValues.entrySet()) {
					query.setParameter(entry.getKey(), entry.getValue());
				}
				
				Long count  = (Long)query.uniqueResult();
				return count.intValue();
			}
		});
	}

	@Override
	public String getMax() {
		// TODO Auto-generated method stub
		return null;
	}
}
