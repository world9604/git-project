package com.mvcdemoweb.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mvcdemoweb.model.dao.OracleNoticeDao;
import com.mvcdemoweb.model.dto.Notice;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	@Qualifier("oracleNoticeDao")
	private OracleNoticeDao noticeDao;

	@Override
	public void insertNotice(Notice notice) {
		
		noticeDao.insertNotice(notice);		
		
	}

	@Override
	public List<Notice> getNoticeList(HashMap<String, Integer> map) {
		
		List<Notice> notices = noticeDao.getNoticeList(map);
		
		return notices;
	}

	@Override
	public Notice getDetailByNoticeNo(int noticeNo) {
		
		Notice notice = noticeDao.getDetailByNoticeNo(noticeNo);
		
		return notice;
	}
	@Override
	public void noticeDeleted(int noticeNo){
		noticeDao.noticeDeleted(noticeNo);
	}

	@Override
	public int getNoticeCount() {
		int total = noticeDao.getNoticeCount();
		return total;
	}
	

}





