package com.mvcdemoweb.model.dto;

import java.io.Serializable;

public class Agency implements Serializable {
	
	private int agencyNo;
	private String repersentative; //대표자
	private String cRN; //사업자등록번호
	private String professionalField; //전문분야
	private String phone;
	private String agencyAddress;
	private String agencyHomepage;
	private int memberNo;
	private int saleRecord; //판매실적
	
	
	public int getAgencyNo() {
		return agencyNo;
	}
	public void setAgencyNo(int agencyNo) {
		this.agencyNo = agencyNo;
	}
	public String getRepersentative() {
		return repersentative;
	}
	public void setRepersentative(String repersentative) {
		this.repersentative = repersentative;
	}
	public String getcRN() {
		return cRN;
	}
	public void setcRN(String cRN) {
		this.cRN = cRN;
	}
	public String getProfessionalField() {
		return professionalField;
	}
	public void setProfessionalField(String professionalField) {
		this.professionalField = professionalField;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAgencyAddress() {
		return agencyAddress;
	}
	public void setAgencyAddress(String agencyAddress) {
		this.agencyAddress = agencyAddress;
	}
	public String getAgencyHomepage() {
		return agencyHomepage;
	}
	public void setAgencyHomepage(String agencyHomepage) {
		this.agencyHomepage = agencyHomepage;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getSaleRecord() {
		return saleRecord;
	}
	public void setSaleRecord(int saleRecord) {
		this.saleRecord = saleRecord;
	}
	

}
