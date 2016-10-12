package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Member implements Serializable {
	
	private int memberNo;
	private String name;
	
	
	private String email;

	private String password;
	private Date birth;
	private String phone;
	private String agencyType; //일반회원인지 중개회사인지
	private String adminType; //회원 타입 
	
	//1 대 다 관계	
	private List<Agency> agencys;
	private List<BuyStore> buyStores;	
	private List<Store> stores;
	private List<Notice> notices;
	private List<SalesManage> salesManages;
	private List<InterestStore> interestStores;
	private List<StoreQna> storeQnas;
	private List<BuyStoreQna> buySoreQnas;
	private List<Question> questions;
	
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAencyType() {
		return agencyType;
	}
	public void setAgencyType(String agencyType) {
		this.agencyType = agencyType;
	}
	public String getAdminType() {
		return adminType;
	}
	public void setAdminType(String adminType) {
		this.adminType = adminType;
	}
	public List<Agency> getAgencys() {
		return agencys;
	}
	public void setAgencys(List<Agency> agencys) {
		this.agencys = agencys;
	}
	public List<BuyStore> getBuyStores() {
		return buyStores;
	}
	public void setBuyStores(List<BuyStore> buyStores) {
		this.buyStores = buyStores;
	}
	public List<Store> getStores() {
		return stores;
	}
	public void setStores(List<Store> stores) {
		this.stores = stores;
	}
	public List<Notice> getNotices() {
		return notices;
	}
	public void setNotices(List<Notice> notices) {
		this.notices = notices;
	}
	public List<SalesManage> getSalesManages() {
		return salesManages;
	}
	public void setSalesManages(List<SalesManage> salesManages) {
		this.salesManages = salesManages;
	}
	public List<InterestStore> getInterestStores() {
		return interestStores;
	}
	public void setInterestStores(List<InterestStore> interestStores) {
		this.interestStores = interestStores;
	}
	public List<StoreQna> getStoreQnas() {
		return storeQnas;
	}
	public void setStoreQnas(List<StoreQna> storeQnas) {
		this.storeQnas = storeQnas;
	}
	public String getAgencyType() {
		return agencyType;
	}
	public List<BuyStoreQna> getBuySoreQnas() {
		return buySoreQnas;
	}
	public void setBuySoreQnas(List<BuyStoreQna> buySoreQnas) {
		this.buySoreQnas = buySoreQnas;
	}


}
