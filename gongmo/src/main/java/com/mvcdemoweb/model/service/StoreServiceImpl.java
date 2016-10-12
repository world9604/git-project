package com.mvcdemoweb.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mvcdemoweb.model.dao.OracleStoreDao;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.BuyStoreQna;
import com.mvcdemoweb.model.dto.CategoryBig;
import com.mvcdemoweb.model.dto.CategoryMiddle;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;


@Service("storeService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	@Qualifier("oracleStoreDao")
	private OracleStoreDao storeDao;
	
	
	@Override
	public void insertStore(Store store) {
		
		storeDao.insertStore(store);
		
	}

	@Override
	public List<Store> getStoreList() {

		List<Store> stores = storeDao.getStoreList();
		
		return stores;
	}
	
	@Override
	public List<CategoryBig> getCategoryBigList() {
		
		List<CategoryBig> categoryBigs = storeDao.getCategoryBigList();
		
		return categoryBigs;
	}	
	@Override
	public List<CategoryMiddle> getCategoryMiddleList() {
		
		List<CategoryMiddle> categoryMiddles = storeDao.getCategoryMiddleList();
		
		return categoryMiddles;
	}
	@Override
	public String getCategoryMiddleNameByMiddleNo(int middleNo) {
		
		String name = storeDao.getCategoryMiddleNameByMiddleNo(middleNo);
		
		return name;
	}


	@Override
	public List<Store> selectStoreListAndImage(int storeNo) {
		List<Store> stores = storeDao.selectStoreListAndImage(storeNo);
		return stores;
	}

	@Override
	public List<Store> selectAllStoreListAndImage() {
		List<Store> stores = storeDao.selectAllStoreListAndImage();
		return stores;
	}
	
	@Override
	public List<Store> selectFiveStoreListAndImage() {
		List<Store> stores = storeDao.selectFiveStoreListAndImage();
		return stores;
	}


	@Override
	public void insertBuyStore(BuyStore buyStore) {

		storeDao.insertBuyStore(buyStore);
		
	}

	@Override
	public List<BuyStore> getBuyStoreList(HashMap<String, Integer> map) {
		
		List<BuyStore> buyStores = storeDao.getBuyStoreList(map);
		
		return buyStores;
	}

	@Override
	public BuyStore getDetailByBuyStoreNo(int buyStoreNo) {
		
		BuyStore buyStore = storeDao.getDetailByBuyStoreNo(buyStoreNo);
		
		return buyStore;
	}

	@Override
	public int getStoreNoForInsertImage() {
		
		int storeNo = storeDao.getStoreNoForInsertImage();
		
		return storeNo;
	}

	@Override
	public void insertImage(StoreImage storeImage) {
		
		storeDao.insertImage(storeImage);
		
	}

	@Override
	public void registerBuyQna(BuyStoreQna buyStoreNo) {
		
		storeDao.registerBuyQna(buyStoreNo);
		
	}

	@Override
	public List<BuyStoreQna> getBuyStoreQnas(int buyStoreNo) {

		List<BuyStoreQna> buyStoreQnas = storeDao.getBuyStoreQnas(buyStoreNo);
		
		return buyStoreQnas;
	}

	@Override
	public void deleteBuyQna(int buyStoreQnaNo) {
		
		storeDao.deleteBuyQna(buyStoreQnaNo);
		
	}

	@Override
	public BuyStoreQna getBuyQnaByBuyQnaNo(int buyStoreQnaNo) {
		
		BuyStoreQna buyStoreQna = storeDao.getBuyQnaByBuyQnaNo(buyStoreQnaNo);
		
		return buyStoreQna;
	}

	@Override
	public void updateStep(HashMap<String, Integer> map) {
		
		storeDao.updateStep(map);
		
	}

	@Override
	public void registerBuyQnaReply(BuyStoreQna buyStoreQna) {
		
		storeDao.registerBuyQnaReply(buyStoreQna);
		
	}

	@Override
	public List<CategoryBig> getCategoryBigAndCategoryMiddleList() {
		
		List<CategoryBig> categoryBigs = storeDao.getCategoryBigAndCategoryMiddleList();
		return categoryBigs;
	}

	@Override
	public List<CategoryMiddle> getCategoryMiddleByBigNo(int bigNo) {
		List<CategoryMiddle> categoryMiddle = storeDao.getCategoryMiddleByBigNo(bigNo);
		return categoryMiddle;
	}

	@Override
	public List<String> getSidoByLocation() {
		List<String> sido = storeDao.getSidoByLocation();
		return sido;
	}

	@Override
	public List<String> getGuGunBySido(String sido) {
		List<String> gugun = storeDao.getGuGunBySido(sido);
		return gugun;
	}
	@Override
	public List<Store> searchlistByleaseOrDealing(String leaseOrDealing){
		List<Store> stores = storeDao.searchlistByleaseOrDealing(leaseOrDealing);
		return stores;
	}
	@Override
	public List<Store> searchlistByleaseOrDealingAndName(String leaseOrDealing, String name){
		List<Store> stores = storeDao.searchlistByleaseOrDealingAndName(leaseOrDealing,name);
		return stores;
	}
	@Override
	public List<Store> searchlistByleaseOrDealingAndstoreAddress(String leaseOrDealing, String storeAddress){
		List<Store> stores = storeDao.searchlistByleaseOrDealingAndstoreAddress(leaseOrDealing,storeAddress);
		return stores;
	}
	
	@Override
	public List<Store> searchlist(String leaseOrDealing, String name,String storeAddress){
		List<Store> stores = storeDao.searchlist(leaseOrDealing,name,storeAddress);
		return stores;
	}

	@Override
	public int getBuyStoreCount() {
		int total = storeDao.getBuyStoreCount();
		return total;
	}
	

	@Override
	public void insertQuestion(Question question){
		storeDao.insertQuestion(question);
	}
	@Override
	public void buystoreDeleted(int buystoreNo){
		storeDao.buystoreDeleted(buystoreNo);
	}
}





