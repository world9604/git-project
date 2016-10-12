package com.mvcdemoweb.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mvcdemoweb.model.dto.Notice;
import com.mvcdemoweb.model.mapper.NoticeMapper;

@Repository(value = "oracleNoticeDao")
public class OracleNoticeDao implements NoticeDao {
	
	
	@Autowired
	@Qualifier("noticeMapper")
	private NoticeMapper noticeMapper;

	
	//공지 등록
	@Override
	public void insertNotice(Notice notice) {
		
		noticeMapper.insertNotice(notice);
		
	}

	//공지 목록
	@Override
	public List<Notice> getNoticeList(HashMap<String, Integer> map) {
		
		List<Notice> notices = noticeMapper.getNoticeList(map);
		
		return notices;
	}

	//공지 상세보기
	@Override
	public Notice getDetailByNoticeNo(int noticeNo) {
		
		Notice notice = noticeMapper.getDetailByNoticeNo(noticeNo);
		
		return notice;
	}
	
	//삭제
	@Override
	public void noticeDeleted(int noticeNo){
		noticeMapper.noticeDeleted(noticeNo);
	}

	//페이저 사용을 위한 전체 게시글 수 조회
	@Override
	public int getNoticeCount() {
		
		int total = noticeMapper.getNoticeCount();
		
		return total;
	}
	

}









