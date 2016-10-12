package com.mvcdemoweb.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.BuyStoreQna;
import com.mvcdemoweb.model.dto.CategoryBig;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.dto.CategoryMiddle;
import com.mvcdemoweb.model.dto.Question;


public interface StoreMapper {

	List<CategoryBig> getCategoryBigList();
	List<CategoryMiddle> getCategoryMiddleList();
	String getCategoryMiddleNameByMiddleNo(int middleNo);
	
	List<Store> getStoreList();
	
	List<Store> selectStoreListAndImage(int storeNo);
	List<Store> selectAllStoreListAndImage();

	void insertStore(Store store);
	void insertBuyStore(BuyStore buyStore);
	

	List<Store> selectFiveStoreListAndImage();

	

	List<BuyStore> getBuyStoreList(HashMap<String, Integer> map);
	BuyStore getDetailByBuyStoreNo(int buyStoreNo);
	
	int getStoreNoForInsertImage();
	void insertImage(StoreImage storeImage);
	
	void registerBuyQna(BuyStoreQna buyStoreNo);
	List<BuyStoreQna> getBuyStoreQnas(int buyStoreNo);
	void deleteBuyQna(int buyStoreQnaNo);
	BuyStoreQna getBuyQnaByBuyQnaNo(int buyStoreQnaNo);
	void updateStep(HashMap<String, Integer> map);
	void registerBuyQnaReply(BuyStoreQna buyStoreQna);
	List<CategoryBig> getCategoryBigAndCategoryMiddleList();
	List<CategoryMiddle> getCategoryMiddleByBigNo(int bigNo);
	List<String> getSidoByLocation();
	List<String> getGuGunBySido(String sido);
	List<Store> searchlistByleaseOrDealing(String leaseOrDealing);
	List<Store> searchlistByleaseOrDealingAndName(HashMap<String, Object> map);
	List<Store> searchlistByleaseOrDealingAndstoreAddress(HashMap<String, Object> map);
	List<Store> searchlist(HashMap<String, Object> map);
	
	int getBuyStoreCount();
	

	void insertQuestion(Question question);
	void buystoreDeleted(int buystoreNo);
}



