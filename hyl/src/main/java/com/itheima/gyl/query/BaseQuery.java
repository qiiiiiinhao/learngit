package com.itheima.gyl.query;

import java.util.HashMap;
import java.util.Map;

/**
 * 1、提供一个抽象方法，让子类完成，把具体的页面上的表单元素封装成map
 * 2、提供一个Map<String,Object>，由子类使用
 * @author zd
 *
 */
public abstract class BaseQuery {
	/**
	 * 当前页码，初始化的值为1
	 */
	private int currentPage = 1;

	/**
	 * 一页显示的条数
	 */
	private int pageSize = 2;
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * 把页面上表单中的表单元素封装成map了
	 */
	private Map<String, Object> keyValues = new HashMap<String, Object>();
	
	public Map<String, Object> getKeyValues() {
		return keyValues;
	}
	public void setKeyValues(Map<String, Object> keyValues) {
		this.keyValues = keyValues;
	}
	/**
	 * 把页面上的查询条件封装成一个Map<String,Object>
	 * 并且返回
	 * @return
	 */
	public abstract Map<String, Object> buildWhere();
	
}
