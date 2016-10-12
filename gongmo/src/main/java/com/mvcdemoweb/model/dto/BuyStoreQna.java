package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class BuyStoreQna implements Serializable {
	
	private int buyStoreQnaNo;
	private String content;
	private int emoticon; // ex) 1이면 첫번째 이모티콘 2면 두번째 이모티콘 이런식
	private int qnaGroup;
	private int qnaDepth;
	private int qnaStep;
	private int buyStoreNo;
	private int memberNo;
	private Date regDate;
	private String writer;
	
	public int getBuyStoreQnaNo() {
		return buyStoreQnaNo;
	}
	public void setBuyStoreQnaNo(int buyStoreQnaNo) {
		this.buyStoreQnaNo = buyStoreQnaNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEmoticon() {
		return emoticon;
	}
	public void setEmoticon(int emoticon) {
		this.emoticon = emoticon;
	}
	public int getQnaGroup() {
		return qnaGroup;
	}
	public void setQnaGroup(int qnaGroup) {
		this.qnaGroup = qnaGroup;
	}
	public int getQnaDepth() {
		return qnaDepth;
	}
	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}
	public int getQnaStep() {
		return qnaStep;
	}
	public void setQnaStep(int qnaStep) {
		this.qnaStep = qnaStep;
	}	
	public int getBuyStoreNo() {
		return buyStoreNo;
	}
	public void setBuyStoreNo(int buyStoreNo) {
		this.buyStoreNo = buyStoreNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	

}
