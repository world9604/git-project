package com.mvcdemoweb.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mvcdemoweb.model.dto.BusStation;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.InterestStore;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.mapper.MemberMapper;

@Repository(value = "oracleMemberDao")
public class OracleMemberDao implements MemberDao {
	
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(Member member) {
		
		memberMapper.insertMember(member);
	}
	
	@Override
	public String selectEmailByLikeEmail(String email) {
		
	String likeemail = memberMapper.selectEmailByLikeEmail(email);
	
	return likeemail;
	}
	
	@Override
	public Member getMemberByEmailAndPasswd(String email, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", password);
		Member member = memberMapper.getMemberByEmailAndPasswd(map);
		
		return member;
		
	}

	@Override
	public String validByEamil(String email){
		String likeEmail = memberMapper.validByEamil(email);
		return likeEmail;
	}
	@Override
	public void memberEdit(Member member){
		memberMapper.memberEdit(member);
	}
	@Override
	public List<Store> searchStoresByMemberNo(int memberNo){
	List<Store> stores	= memberMapper.searchStoresByMemberNo(memberNo);
	return stores;
	}
	@Override
	public Store searchStoreByStoreNo(int storeNo){
		Store store = memberMapper.searchStoreByStoreNo(storeNo);
		return store;
	}
	@Override
	public List<StoreImage> searchStoreImagesByStoreNo(int storeNo){
		List<StoreImage> storeImages = memberMapper.searchStoreImagesByStoreNo(storeNo);
		
		return storeImages;
	}
	@Override
	public List<StoreImage> searchStoreImagesByMemberNo(){
		List<StoreImage> storeImages = memberMapper.searchStoreImagesByMemberNo();
		
		return storeImages;
	}
	@Override
	public List<Store> allstore(){
		List<Store> stores = memberMapper.allstore();
		
		return stores;
	}
	@Override
	public Member searchMemberByMemberNo(int memberNo) {
		
		 Member member = memberMapper.searchMemberByMemberNo(memberNo);
		return member;
	}
	@Override
	public void upDataSellStatue(int storeNo) {
		memberMapper.upDataSellStatue(storeNo);
	}
	@Override
	public void interestStore(int memberNo,int storeNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("storeNo", storeNo);
		memberMapper.interestStore(map);
	}
	@Override
	public InterestStore searchinterestStorekLike(int memberNo,int storeNo) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("storeNo", storeNo);
		InterestStore interestStore = memberMapper.searchinterestStorekLike(map);
		return interestStore;
	}
	@Override
	public InterestStore searchinterestStorekLikelonmemberNo(int lonmemberNo,int storeNo) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("lonmemberNo", lonmemberNo);
		map.put("storeNo", storeNo);
		InterestStore interestStore = memberMapper.searchinterestStorekLikelonmemberNo(map);
		return interestStore;
	}
	@Override
	public List<Store> selectInterestStoreBymemberNo(int memberNo){
		List<Store> stores = memberMapper.selectInterestStoreBymemberNo(memberNo);
		return stores;
	}

	//내 매수관리 페이지 리스트 받아오기
	@Override
	public List<BuyStore> getBuyListByMemberNo(HashMap<String, Integer> map) {
		
		List<BuyStore> buyStore = memberMapper.getBuyListByMemberNo(map);
		
		return buyStore;
	}


	@Override
	public String getMiddlecodeByMiddleNo(String middleNo) {
		                    
		return memberMapper.getMiddlecodeByMiddleNo(middleNo);
	}

	@Override    
	public String getMiddleorsmallByMiddleNo(String middleNo) {
	
		return memberMapper.getMiddleorsmallByMiddleNo(middleNo);
	}

	@Override
	public String getMiddleNoByStoreNo(String storeNo) {
		
		return memberMapper.getMiddleNoByStoreNo(storeNo);
	}
	
	
	

	@Override
	public List<Question> questionList(HashMap<String, Integer> map){
		List<Question>questions= memberMapper.questionList(map);
		
		return questions;
	}
	@Override
	public List<Member> allMember(){
		List<Member> allMember = memberMapper.allMember();
		return allMember;
	}
	@Override
	public List<InterestStore> allInterestStore(){
		List<InterestStore> interestStores = memberMapper.allInterestStore();
		return interestStores;	
	}
	@Override
	public void intereststoreDeleted(int intereststoreNo){
		memberMapper.intereststoreDeleted(intereststoreNo);
	}
	@Override
	public void questionDeleted(int questionNo){
		memberMapper.questionDeleted(questionNo);
	}
	@Override
	public void storesellStatue(int storeNo){
		memberMapper.storesellStatue(storeNo);
	}



	@Override
	public ArrayList<BusStation> getBusStationBybusStationName(String busStationName) {
		
		return memberMapper.getBusStationBybusStationName(busStationName);
	}




	//페이저 사용을 위한 내 구합니다 목록 갯수 조회

	@Override
	public int getMybuylistCount(int memberNo) {
		int total = memberMapper.getMybuylistCount(memberNo);
		return total;
	}

	
	//페이저 사용을 위한 문의 갯수 조회
	@Override
	public int getQuestionCount(int memberNo) {
		int total = memberMapper.getQuestionCount(memberNo);
		return total;
	}

}









