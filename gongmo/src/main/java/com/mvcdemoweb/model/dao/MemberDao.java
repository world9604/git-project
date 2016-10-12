package com.mvcdemoweb.model.dao;


import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;

import com.mvcdemoweb.model.dto.BusStation;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.InterestStore;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;

public interface MemberDao {

	void insertMember(com.mvcdemoweb.model.dto.Member member);
	String selectEmailByLikeEmail(String email);
	Member getMemberByEmailAndPasswd(String email, String password);
	
	String validByEamil(String email);
	void memberEdit(Member member);
	List<Store> searchStoresByMemberNo(int memberNo);
	Store searchStoreByStoreNo(int storeNo);
	List<StoreImage> searchStoreImagesByStoreNo(int storeNo);
	List<StoreImage> searchStoreImagesByMemberNo();
	List<Store> allstore();
	Member searchMemberByMemberNo(int memberNo);
	void upDataSellStatue(int storeNo);
	void interestStore(int memberNo,int storeNo);
	InterestStore searchinterestStorekLike(int memberNo,int storeNo);
	InterestStore searchinterestStorekLikelonmemberNo(int lonmemberNo,int storeNo);
	List<Store> selectInterestStoreBymemberNo(int memberNo);
	List<BuyStore> getBuyListByMemberNo(HashMap<String, Integer> map);
	String getMiddlecodeByMiddleNo(String middleNo); 
	String getMiddleorsmallByMiddleNo(String middleNo);
	String getMiddleNoByStoreNo(String storeNo);
	List<Question> questionList(HashMap<String, Integer> map);
	List<Member> allMember();

	ArrayList<BusStation> getBusStationBybusStationName(String busStationName);		

	List<InterestStore> allInterestStore();
	void intereststoreDeleted(int intereststoreNo);
	void questionDeleted(int questionNo);
	void storesellStatue(int storeNo);
	
	int getMybuylistCount(int memberNo);

	int getQuestionCount(int memberNo);
	

}