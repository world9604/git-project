package com.mvcdemoweb.model.dao;

import java.util.HashMap;
import java.util.List;

import com.mvcdemoweb.model.dto.Notice;

public interface NoticeDao {
	
	void insertNotice(Notice notice);
	List<Notice> getNoticeList(HashMap<String, Integer> map);
	Notice getDetailByNoticeNo(int noticeNo);	
	void noticeDeleted(int noticeNo);
	
	int getNoticeCount();
	
}