package com.itheima.gyl.base.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import com.itheima.gyl.query.BaseQuery;
import com.itheima.gyl.query.PageResult;



public interface BaseService<T>{
	public PageResult<T> getPageResult(final BaseQuery baseQuery);
	public Collection<T> getEntries();
	public Set<T> getEntriesByIds(Serializable[] ids);
	public void saveEntry(T t);
	public void updateEntry(T t);
	public T getEntryById(Serializable id);
	public void deleteEntriesByIds(Serializable[] ids);
	public void deleteEntryById(Serializable id);
}
