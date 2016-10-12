package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Question implements Serializable {
	
	private int questionNo;
	private int memberNo;
	private int storeNo;
	private String questionTitle;
	private String questionContents;
	private String state;
	private int storeMemberNo;
	
	public int getStoreMemberNo() {
		return storeMemberNo;
	}
	public void setStoreMemberNo(int storeMemberNo) {
		this.storeMemberNo = storeMemberNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContents() {
		return questionContents;
	}
	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	

	

}
