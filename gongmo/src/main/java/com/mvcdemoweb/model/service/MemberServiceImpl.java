package com.mvcdemoweb.model.service;


import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mvcdemoweb.model.dao.OracleMemberDao;
import com.mvcdemoweb.model.dto.BusStation;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.InterestStore;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;


@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	@Qualifier("oracleMemberDao")
	private OracleMemberDao memberDao;
	
	
	@Override
	public void insertMember(Member member) {
		memberDao.insertMember(member);
	}
	
	@Override
	public String selectEmailByLikeEmail(String email) {
	
	String likeemail  = memberDao.selectEmailByLikeEmail(email);
	
	return likeemail;
	}
	
	@Override
	public Member getMemberByEmailAndPasswd(String email, String password) {
		
		 Member member = memberDao.getMemberByEmailAndPasswd(email, password);
		return member;
	}

	
	@Override
	public String validByEamil(String email){
		String likeEmail = memberDao.validByEamil(email);
		return likeEmail;
	}
	@Override
	public void memberEdit(Member member){
		memberDao.memberEdit(member);
	}
	@Override
	public List<Store> searchStoresByMemberNo(int memberNo){
	List<Store> stores	= memberDao.searchStoresByMemberNo(memberNo);
	return stores;
	}
	@Override
	public Store searchStoreByStoreNo(int storeNo){
		Store store = memberDao.searchStoreByStoreNo(storeNo);
		return store;
	}
	@Override
	public List<StoreImage> searchStoreImagesByStoreNo(int storeNo){
		List<StoreImage> storeImages = memberDao.searchStoreImagesByStoreNo(storeNo);
		return storeImages;
	}
	@Override
	public List<StoreImage> searchStoreImagesByMemberNo(){
		List<StoreImage> storeImages = memberDao.searchStoreImagesByMemberNo();
		
		return storeImages;
	}
	@Override
	public List<Store> allstore(){
		List<Store> stores = memberDao.allstore();
		
		return stores;
	}
	@Override
	public Member searchMemberByMemberNo(int memberNo) {
		
		 Member member = memberDao.searchMemberByMemberNo(memberNo);
		return member;
	}
	@Override
	public void upDataSellStatue(int storeNo) {
		memberDao.upDataSellStatue(storeNo);
	}
	@Override
	public void interestStore(int memberNo,int storeNo) {
		memberDao.interestStore(memberNo,storeNo);
	}
	@Override
	public InterestStore searchinterestStorekLike(int memberNo,int storeNo) {
		
		InterestStore interestStore = memberDao.searchinterestStorekLike(memberNo,storeNo);
		return interestStore;
	}
	@Override
	public InterestStore searchinterestStorekLikelonmemberNo(int lonmemberNo,int storeNo) {
		
		InterestStore interestStore = memberDao.searchinterestStorekLikelonmemberNo(lonmemberNo,storeNo);
		return interestStore;
	}
	@Override
	public List<Store> selectInterestStoreBymemberNo(int memberNo){
		List<Store> stores = memberDao.selectInterestStoreBymemberNo(memberNo);
		return stores;
	}

	@Override
	public List<BuyStore> getBuyListByMemberNo(HashMap<String, Integer> map) {
		List<BuyStore> buyStore = memberDao.getBuyListByMemberNo(map);
		
		return buyStore;
	}


	@Override
	public String getMiddlecodeByMiddleNo(String middleNo) {

		return memberDao.getMiddlecodeByMiddleNo(middleNo);
	}

	@Override
	public String getMiddleorsmallByMiddleNo(String middleNo) {
	
		return memberDao.getMiddleorsmallByMiddleNo(middleNo);
	}

	@Override
	public String getMiddleNoByStoreNo(String storeNo) {
		
		return memberDao.getMiddleNoByStoreNo(storeNo);
	}

	@Override
	public List<Question> questionList(HashMap<String, Integer> map){
		List<Question>questions= memberDao.questionList(map);
		
		return questions;
	}
	@Override
	public List<Member> allMember(){
		List<Member> allMember = memberDao.allMember();
		return allMember;
	}
	@Override
	public List<InterestStore> allInterestStore(){
		List<InterestStore> interestStores = memberDao.allInterestStore();
		return interestStores;
	}
	@Override
	public void intereststoreDeleted(int intereststoreNo){
		memberDao.intereststoreDeleted(intereststoreNo);
	}
	@Override
	public void questionDeleted(int questionNo){
		memberDao.questionDeleted(questionNo);
	}
	@Override
	public void storesellStatue(int storeNo){
		memberDao.storesellStatue(storeNo);
	}


	@Override
	public ArrayList<BusStation> getBusStationBybusStationName(String busStationName) {
	
		return memberDao.getBusStationBybusStationName(busStationName);
	}


	@Override
	public int getMybuylistCount(int memberNo) {
		int total = memberDao.getMybuylistCount(memberNo);
		return total;
	}


	@Override
	public int getQuestionCount(int memberNo) {
		int total = memberDao.getQuestionCount(memberNo);
		return total;
	}

}





