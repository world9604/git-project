package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.util.List;

public class CategoryMiddle implements Serializable {
	
	private int middleNo; //중분류 번호
	private int bigNo; //대분류 번호
	private String middleName; // 중분류 명칭
	private String middleCode;
	private String middleOrSmall;
	
	//1 대 다 관계
	private List<BuyStore> buyStore;	
	private List<Store> store;	
	
	public int getMiddleNo() {
		return middleNo;
	}
	public void setMiddleNo(int middleNo) {
		this.middleNo = middleNo;
	}
	public int getBigNo() {
		return bigNo;
	}
	public void setBigNo(int bigNo) {
		this.bigNo = bigNo;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getMiddleCode() {
		return middleCode;
	}
	public void setMiddleCode(String middleCode) {
		this.middleCode = middleCode;
	}
	public String getMiddleOrSmall() {
		return middleOrSmall;
	}
	public void setMiddleOrSmall(String middleOrSmall) {
		this.middleOrSmall = middleOrSmall;
	}
	public List<BuyStore> getBuyStore() {
		return buyStore;
	}
	public void setBuyStore(List<BuyStore> buyStore) {
		this.buyStore = buyStore;
	}
	public List<Store> getStore() {
		return store;
	}
	public void setStore(List<Store> store) {
		this.store = store;
	}
	
	
	
	
	

}
