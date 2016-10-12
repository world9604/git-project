package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class BuyStore implements Serializable {
	
	private int buyStoreNo;
	private String title;
	private String content;
	private Date regDate;
	private int memberNo;
	private int middleNo;
	private String writer;
	private boolean statue; //0이면 미판, 1이면 판매완료 (default 값 0으로 삽입 후 판매 완료되면 1로 업데이트)
	private String sido;
	private String gugun;
	
	//1대 다 관계
	private List<BuyStoreQna> buyStoreQnas;
	
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	
	public boolean isStatue() {
		return statue;
	}
	public void setStatue(boolean statue) {
		this.statue = statue;
	}
	public int getBuyStoreNo() {
		return buyStoreNo;
	}
	public void setBuyStoreNo(int buyStoreNo) {
		this.buyStoreNo = buyStoreNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getMiddleNo() {
		return middleNo;
	}
	public void setMiddleNo(int middleNo) {
		this.middleNo = middleNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public List<BuyStoreQna> getBuyStoreQnas() {
		return buyStoreQnas;
	}
	public void setBuyStoreQnas(List<BuyStoreQna> buyStoreQnas) {
		this.buyStoreQnas = buyStoreQnas;
	}
	
	

}
