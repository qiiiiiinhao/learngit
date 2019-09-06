package com.itheima.gyl.base.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import com.itheima.gyl.base.dao.BaseDao;
import com.itheima.gyl.base.service.BaseService;
import com.itheima.gyl.query.BaseQuery;
import com.itheima.gyl.query.PageResult;




public abstract class BaseServiceImpl<T> implements BaseService<T>{
	public abstract BaseDao getBaseDao();
	@Override
	public PageResult<T> getPageResult(BaseQuery baseQuery) {
		// TODO Auto-generated method stub
		return this.getBaseDao().findPageResult(baseQuery);
	}

	@Transactional
	public void saveEntry(T t) {
		// TODO Auto-generated method stub
		this.getBaseDao().saveEntry(t);
	}

	@Transactional
	public void updateEntry(T t) {
		// TODO Auto-generated method stub
		this.getBaseDao().updateEntry(t);
	}

	@Override
	public T getEntryById(Serializable id) {
		// TODO Auto-generated method stub
		return (T)this.getBaseDao().getEntryById(id);
	}

	@Transactional
	public void deleteEntriesByIds(Serializable[] ids) {
		// TODO Auto-generated method stub
		this.getBaseDao().deleteEntriesByIDS(ids);
	}

	@Transactional
	public void deleteEntryById(Serializable id) {
		// TODO Auto-generated method stub
		this.getBaseDao().deleteEntry(id);
	}
	
	public Collection<T> getEntries(){
		return this.getBaseDao().findEntry();
	}
	
	public Set<T> getEntriesByIds(Serializable[] ids){
		return this.getBaseDao().getEntriesByIds(ids);
	}
}
