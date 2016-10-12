package com.mvcdemoweb.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.BuyStoreQna;
import com.mvcdemoweb.model.dto.CategoryBig;
import com.mvcdemoweb.model.dto.CategoryMiddle;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.mapper.StoreMapper;

@Repository(value = "oracleStoreDao")
public class OracleStoreDao implements StoreDao {
	
	
	@Autowired
	@Qualifier("storeMapper")
	private StoreMapper storeMapper;
	
	//가게 등록
	@Override
	public void insertStore(Store store) {
		
		storeMapper.insertStore(store);
		
	}
	
	//가게 목록 조회
	public List<Store> getStoreList(){
		
		List<Store> stores = storeMapper.getStoreList();
		
		return stores;
	}

	//대분류 조회
	@Override
	public List<CategoryBig> getCategoryBigList() {
		
		List<CategoryBig> categoryBigs = storeMapper.getCategoryBigList();
		
		return categoryBigs;
	}
	//중분류 조회
	@Override
	public List<CategoryMiddle> getCategoryMiddleList() {
		
		List<CategoryMiddle> categoryMiddles = storeMapper.getCategoryMiddleList();
		
		return categoryMiddles;
	}
	//중분류 번호로 명칭 조회 (가게 등록시 사용)
	@Override
	public String getCategoryMiddleNameByMiddleNo(int middleNo) {
		
		String name = storeMapper.getCategoryMiddleNameByMiddleNo(middleNo);
		
		return name;
	}
	
	public List<Store> selectStoreListAndImage(int storeNo){
		List<Store> stores =storeMapper.selectStoreListAndImage(storeNo);
		
		return stores;
	}
	@Override
	public List<Store> selectAllStoreListAndImage() {
		List<Store> stores = storeMapper.selectAllStoreListAndImage();
		return stores;
	}
	
	//가게 구합니다 등록
	@Override
	public void insertBuyStore(BuyStore buyStore) {
		
		storeMapper.insertBuyStore(buyStore);
		
	}


	public List<Store> selectFiveStoreListAndImage() {
		List<Store> stores = storeMapper.selectFiveStoreListAndImage();
		return stores;
	}


	//가게 구합니다 목록
	@Override
	public List<BuyStore> getBuyStoreList(HashMap<String, Integer> map) {
		
		List<BuyStore> buyStores = storeMapper.getBuyStoreList(map);
		
		return buyStores;
	}
	
	//가게 구합니다 상세보기
	@Override
	public BuyStore getDetailByBuyStoreNo(int buyStoreNo) {
		
		BuyStore buyStore = storeMapper.getDetailByBuyStoreNo(buyStoreNo);
		
		return buyStore;
	}

	//가게 이미지 등록을 위해 최신 등록 가게 조회하여 storeNo 가져오기
	@Override
	public int getStoreNoForInsertImage() {
		
		int storeNo = storeMapper.getStoreNoForInsertImage();
		
		return storeNo;
	}

	//가게 이미지 등록
	@Override
	public void insertImage(StoreImage storeImage) {
		
		storeMapper.insertImage(storeImage);
		
	}

	/////////////////////////////////////////////////////////////////
	//qna 파트
	
	//구합니다qna 등록
	@Override
	public void registerBuyQna(BuyStoreQna buyStoreNo) {
		
		storeMapper.registerBuyQna(buyStoreNo);
		
	}

	//qna 리스트 뽑기
	@Override
	public List<BuyStoreQna> getBuyStoreQnas(int buyStoreNo) {
		
		List<BuyStoreQna> buyStoreQnas = storeMapper.getBuyStoreQnas(buyStoreNo);
		
		return buyStoreQnas;
	}

	//qna 삭제
	@Override
	public void deleteBuyQna(int buyStoreQnaNo) {
		
		storeMapper.deleteBuyQna(buyStoreQnaNo);
		
	}
	
	//qna 하나만 조회 (답글 등록을 위해)
	@Override
	public BuyStoreQna getBuyQnaByBuyQnaNo(int buyStoreQnaNo) {
		
		BuyStoreQna buyStoreQna = storeMapper.getBuyQnaByBuyQnaNo(buyStoreQnaNo);
		
		return buyStoreQna;
	}
	//step 컬럼 업데이트 (답글 등록을 위해)
	@Override
	public void updateStep(HashMap<String, Integer> map) {
		
		storeMapper.updateStep(map);
		
	}

	//qna 답글 등록
	@Override
	public void registerBuyQnaReply(BuyStoreQna buyStoreQna) {
		
		storeMapper.registerBuyQnaReply(buyStoreQna);
		
	}

	public List<CategoryBig> getCategoryBigAndCategoryMiddleList() {
		
		List<CategoryBig> categoryBigs = storeMapper.getCategoryBigAndCategoryMiddleList();
		return categoryBigs;
	}

	public List<CategoryMiddle> getCategoryMiddleByBigNo(int bigNo) {

		List<CategoryMiddle> categoryMiddle= storeMapper.getCategoryMiddleByBigNo(bigNo);
		return categoryMiddle;
	}

	public List<String> getSidoByLocation() {
		List<String> sido = storeMapper.getSidoByLocation();
		return sido;
	}

	public List<String> getGuGunBySido(String sido) {
		List<String> gugun = storeMapper.getGuGunBySido(sido);
		return gugun;
	}
	
	@Override
	public List<Store> searchlistByleaseOrDealing(String leaseOrDealing){
		List<Store> stores = storeMapper.searchlistByleaseOrDealing(leaseOrDealing);
		return stores;
	}
	@Override
	public List<Store> searchlistByleaseOrDealingAndName(String leaseOrDealing, String name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("leaseOrDealing", leaseOrDealing);	
		map.put("name", name);
		List<Store> stores = storeMapper.searchlistByleaseOrDealingAndName(map);
		return stores;
	}
	@Override
	public List<Store> searchlistByleaseOrDealingAndstoreAddress(String leaseOrDealing, String storeAddress){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("leaseOrDealing", leaseOrDealing);	
		map.put("storeAddress", storeAddress);
		List<Store> stores = storeMapper.searchlistByleaseOrDealingAndstoreAddress(map);
		return stores;
	}
	@Override
	public List<Store> searchlist(String leaseOrDealing, String name,String storeAddress){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("leaseOrDealing", leaseOrDealing);	
		map.put("storeAddress", storeAddress);
		map.put("name", name);
		List<Store> stores = storeMapper.searchlist(map);
		return stores;
	}
	
	@Override
	public void insertQuestion(Question question){
		storeMapper.insertQuestion(question);
	}


	///////////////////////////////////////////////////////////////////////////////////////////////////////
	//페이저 파트
	
	//구합니다 게시물 페이저
	@Override
	public int getBuyStoreCount() {
		int total = storeMapper.getBuyStoreCount();
		return total;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void buystoreDeleted(int buystoreNo){
		storeMapper.buystoreDeleted(buystoreNo);
	}
}









