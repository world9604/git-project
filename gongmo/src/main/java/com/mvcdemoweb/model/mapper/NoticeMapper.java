package com.mvcdemoweb.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.mvcdemoweb.model.dto.Notice;

public interface NoticeMapper {

	void insertNotice(Notice notice);
	List<Notice> getNoticeList(HashMap<String, Integer> map);
	Notice getDetailByNoticeNo(int NoticeNo);
	void noticeDeleted(int noticeNo);
	
	int getNoticeCount();
	
}



