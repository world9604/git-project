package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	
	private int noticeNo;
	private int memberNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private boolean sellStatue; //0이면 미판, 1이면 판매완료 (default 값 0으로 삽입 후 판매 완료되면 1로 업데이트)
	private String savedFileName; //실제 파일 이름
	private String uploadFileName; //db에 저장될 이름
	
	public String getSavedFileName() {
		return savedFileName;
	}
	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public boolean isSellStatue() {
		return sellStatue;
	}
	public void setSellStatue(boolean sellStatue) {
		this.sellStatue = sellStatue;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	


}
