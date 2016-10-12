package com.mvcdemoweb.model.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Store implements Serializable {
	
	private int storeNo;
	private String storeName;
	private String storeAddress;
	private String storeFloor; //가게가 위치한 층수
	private String type;//업종
	private int admittedNum; //수용가능 인원
	private int pyeong; //면적(평)
	private String leaseOrDealing; //임대 or 매매 선택
	private int dealingPrice; //매매 대금
	private int leaseDeposit; //임대 보증

	private int leasePremium; //임대 권리금 (매매 권리금도 그냥 같이 사용)

	private int leaseMonthlyRent; //임대 월세
	private int salesMonthly; //월매출
	private int salesCost; //경비
	private int salesMonthlyProfit; //매매 - 월수익 (월매출 - 경비 계산해서 삽입)
	private int salesEarningsRate; //매매 - 수익률 (경비 / 월매출 * 100 계산후 반올림해서 삽입)
	private String salesExplanation; //매매 - 설명
	private String storeFeature; //가게 특징
	private String aroundSubway; //주변 지하철 정보
	private String availableParkingNum; //주차 가능 수
	private String etcTraffic; //기타 교통정보
	private String enterDay; //입점 가능일 (ex - 즉시, 협의, 3달내로 등)
	private String interiorAndSellReason; //인테리어 및 판매 이유 설명
	private String sellType; //직거래인지 중개업소 거래인지
	private int memberNo;	//등록자 넘버
	private int middleNo; //중분류 번호
	private boolean sellStatue; //0이면 미판, 1이면 판매완료 (default 값 0으로 삽입 후 판매 완료되면 1로 업데이트)
	private Date regDate;  //등록 날자
	private int buyerNo;	//구매자 번호
	private String canCallTime; //통화가능 시간
	
	//1 대 다 관계


	private List<StoreQna> storeQna;
	private List<StoreImage> storeImage;
	private List<InterestStore> interestStore;
	private List<SalesManage> salesManage;
	private List<Question> questions;
	

	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public List<StoreImage> getStoreImage() {
		return storeImage;
	}
	public void setStoreImage(List<StoreImage> storeImage) {
		this.storeImage = storeImage;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreFloor() {
		return storeFloor;
	}
	public void setStoreFloor(String storeFloor) {
		this.storeFloor = storeFloor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAdmittedNum() {
		return admittedNum;
	}
	public void setAdmittedNum(int admittedNum) {
		this.admittedNum = admittedNum;
	}
	public int getPyeong() {
		return pyeong;
	}
	public void setPyeong(int pyeong) {
		this.pyeong = pyeong;
	}
	public String getLeaseOrDealing() {
		return leaseOrDealing;
	}
	public void setLeaseOrDealing(String leaseOrDealing) {
		this.leaseOrDealing = leaseOrDealing;
	}
	public int getDealingPrice() {
		return dealingPrice;
	}
	public void setDealingPrice(int dealingPrice) {
		this.dealingPrice = dealingPrice;
	}
	public int getLeaseDeposit() {
		return leaseDeposit;
	}
	public void setLeaseDeposit(int leaseDeposit) {
		this.leaseDeposit = leaseDeposit;
	}
	public int getLeasePremium() {
		return leasePremium;
	}
	public void setLeasePremium(int leasePremium) {
		this.leasePremium = leasePremium;
	}
	public int getLeaseMonthlyRent() {
		return leaseMonthlyRent;
	}
	public void setLeaseMonthlyRent(int leaseMonthlyRent) {
		this.leaseMonthlyRent = leaseMonthlyRent;
	}
	public int getSalesMonthly() {
		return salesMonthly;
	}
	public void setSalesMonthly(int salesMonthly) {
		this.salesMonthly = salesMonthly;
	}
	public int getSalesCost() {
		return salesCost;
	}
	public void setSalesCost(int salesCost) {
		this.salesCost = salesCost;
	}
	public int getSalesMonthlyProfit() {
		return salesMonthlyProfit;
	}
	public void setSalesMonthlyProfit(int salesMonthlyProfit) {
		this.salesMonthlyProfit = salesMonthlyProfit;
	}
	public int getSalesEarningsRate() {
		return salesEarningsRate;
	}
	public void setSalesEarningsRate(int salesEarningsRate) {
		this.salesEarningsRate = salesEarningsRate;
	}
	public String getSalesExplanation() {
		return salesExplanation;
	}
	public void setSalesExplanation(String salesExplanation) {
		this.salesExplanation = salesExplanation;
	}
	public String getStoreFeature() {
		return storeFeature;
	}
	public void setStoreFeature(String storeFeature) {
		this.storeFeature = storeFeature;
	}
	public String getAroundSubway() {
		return aroundSubway;
	}
	public void setAroundSubway(String aroundSubway) {
		this.aroundSubway = aroundSubway;
	}
	public String getAvailableParkingNum() {
		return availableParkingNum;
	}
	public void setAvailableParkingNum(String availableParkingNum) {
		this.availableParkingNum = availableParkingNum;
	}
	public String getEtcTraffic() {
		return etcTraffic;
	}
	public void setEtcTraffic(String etcTraffic) {
		this.etcTraffic = etcTraffic;
	}
	public String getEnterDay() {
		return enterDay;
	}
	public void setEnterDay(String enterDay) {
		this.enterDay = enterDay;
	}
	public String getInteriorAndSellReason() {
		return interiorAndSellReason;
	}
	public void setInteriorAndSellReason(String interiorAndSellReason) {
		this.interiorAndSellReason = interiorAndSellReason;
	}
	public String getSellType() {
		return sellType;
	}
	public void setSellType(String sellType) {
		this.sellType = sellType;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getMiddleNo() {
		return middleNo;
	}
	public void setMiddleNo(int middleNo) {
		this.middleNo = middleNo;
	}
	public boolean isSellStatue() {
		return sellStatue;
	}
	public void setSellStatue(boolean sellStatue) {
		this.sellStatue = sellStatue;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getBuyerNo() {
		return buyerNo;
	}
	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}
	public String getCanCallTime() {
		return canCallTime;
	}
	public void setCanCallTime(String canCallTime) {
		this.canCallTime = canCallTime;
	}
	public List<StoreQna> getStoreQna() {
		return storeQna;
	}
	public void setStoreQna(List<StoreQna> storeQna) {
		this.storeQna = storeQna;
	}
	public List<InterestStore> getInterestStore() {
		return interestStore;
	}
	public void setInterestStore(List<InterestStore> interestStore) {
		this.interestStore = interestStore;
	}
	public List<SalesManage> getSalesManage() {
		return salesManage;
	}
	public void setSalesManage(List<SalesManage> salesManage) {
		this.salesManage = salesManage;
	}
	
	

}
