package com.mvcdemoweb.model.dto;

import java.io.Serializable;

public class StoreImage implements Serializable {
	
	private int storeImageNo;
	private String savedFileName; //실제 파일 이름
	private String uploadFileName; //db에 저장될 이름
	private int storeNo;
	private String savedPath;//이미지 저장 경로
	
	public void setSavedPath(String savedPath) {
		this.savedPath = savedPath;
	}
	
	public String getSavedPath() {
		return savedPath;
	}		
	
	public int getStoreImageNo() {
		return storeImageNo;
	}
	public void setStoreImageNo(int storeImageNo) {
		this.storeImageNo = storeImageNo;
	}
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
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	
	

}
