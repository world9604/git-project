package com.mvcdemoweb.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import java.util.HashSet;
import java.util.LinkedHashSet;

import java.util.HashMap;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mvcdemoweb.common.Util;
import com.mvcdemoweb.model.dto.AroundStore;
import com.mvcdemoweb.model.dto.AroundStoreGongGong;
import com.mvcdemoweb.model.dto.BusStation;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.InterestStore;
import com.mvcdemoweb.model.dto.LocationPoint;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.dto.SubwayItem;
import com.mvcdemoweb.model.service.MemberServiceImpl;
import com.mvcdemoweb.ui.ThePager;



@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl memberService;

	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(Member member) {
		
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		
		memberService.insertMember(member);

		return "redirect:/home.action";

	}

	@RequestMapping(value = "/emailsearch.action", method = RequestMethod.GET)
	public void search(HttpServletResponse response, HttpServletRequest request, @ModelAttribute Member member) {

		try {
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter writer = response.getWriter();
			String email = request.getParameter("id");
			// 요청 데이터 읽어서 변수에 저장 (없으면 오류 반환)
			if (email == null || email.length() == 0) {
				writer.print("Email을 입력하세요.");
			}

			// 요청된 데이터로 검색 (검색 실패하면 오류 반환)
			String likeemail = memberService.selectEmailByLikeEmail(email);

			if (likeemail == null) {
				writer.print("사용 가능한 아이디 입니다..");

			}
			// 검색 결과를 문자열 형태로 반환
			if (likeemail != null) {
				writer.print("사용 불가능한 아이디입니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "memberEdit.action", method = RequestMethod.POST)
	public String memberedit(Member member,HttpSession session) {

		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		memberService.memberEdit(member);
		String email =member.getEmail();
		String password = member.getPassword();
		member = memberService.getMemberByEmailAndPasswd(email, password);
		session.setAttribute("loginuser", member);
		return "redirect:/home.action";

	}

	@RequestMapping(value = "validByEamil.action", method = RequestMethod.POST)
	@ResponseBody
	public String validByEamil(@ModelAttribute Member member, String email) {
		
		String likeEmail = memberService.validByEamil(email);
		if (likeEmail == null) {

			return "success";

		} else {

			return "fail";
		}
	}

	@RequestMapping(value = "storeList.action", method = RequestMethod.GET)
	public String searchStoresByMemberNo(Model model, @ModelAttribute Member member) {
		// Location location =
		// locationService.getLocationByLocationName(locationName);
		// ArrayList<Room> rooms =
		// roomService.searchRoomsByLocationName(locationName);
	/*	Member sessionMember = (Member) session.getAttribute("loginuser");*/
	/*System.out.println(sessionMember.getMemberNo());*/
		/*if(member.getMemberNo() == sessionMember.getMemberNo()){*/
		List<Store> stores = memberService.searchStoresByMemberNo(member.getMemberNo());
		List<StoreImage> storeImages = memberService.searchStoreImagesByMemberNo();
		model.addAttribute("storeImages", storeImages);
		model.addAttribute("stores", stores);
		
		return "member/list";
		/*}else{
			return "redirect:/home.action";
		}*/
	}


//다음api로반경내 지하철 역이름을 구하고 서울시 공공데이터로 해당 지하철 승하차 인월을 조회해옴
public ArrayList<SubwayItem> subwayUrl(String lat, String lng) {		

	ArrayList<SubwayItem> subwayItems = new ArrayList<>();
	StringBuilder sb = null;
	//서울시 공공데이터(지하철 일자별 승하차인원 )
	try {
		URL url = new URL("http://openapi.seoul.go.kr:8088/575a755572776f723733486e587745/json/CardSubwayStatsNew/1/1000/20160226");
		 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	       conn.setRequestMethod("GET");
	       conn.setRequestProperty("Content-type", "application/json");
	       
	       Gson gson = new Gson();
	       BufferedReader rd;
		       
	       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       } else {
	           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	       }
	       
	       sb = new StringBuilder();
	       String line;
	       while ((line = rd.readLine()) != null) {
	           sb.append(line);
	       }
	       rd.close();
	       conn.disconnect();
	      
	       JsonParser parser = new JsonParser();
			JsonObject doc = parser.parse(sb.toString()).getAsJsonObject();
			JsonObject row = doc.getAsJsonObject("CardSubwayStatsNew");//{"channel":{...,items:[{...}]}}
			JsonArray items = row.getAsJsonArray("row");	
			
			
			
			////////////////////////////아래는 다음api를 이용하여 반경내 지하철 역 알아오기/////////////////////
			LocationPoint storePoint = new LocationPoint(lat, lng);
			ArrayList<AroundStore> aroundSubway = (ArrayList<AroundStore>)getHinterlandByStorePoint(storePoint, "SW8", "2000");	
			
			
			
			//아래는 다음api 반경내 지하철 역이름
			for(int i=0; i<aroundSubway.size(); i++){
				String[] subwayArray = aroundSubway.get(i).getTitle().split(" ");
				String subwayName= subwayArray[0];
				String subwayLine= subwayArray[1];
				String subwayNameFinally=subwayName.substring(0,subwayName.length()-1);
				
				//밑에는 서울시공공데이터 지하철역 이름과 승하차인원 items(서울시공공데이터는 신분당선이 없고 다음은 신분당선 있음 조심!!)
				for(int j=0; j<items.size(); j++){
					JsonObject element = items.get(j).getAsJsonObject();
					SubwayItem item = gson.fromJson(element, SubwayItem.class);
					if(subwayNameFinally.equals(item.getSUB_STA_NM())){//역명이 같은지 조회
						if(!subwayLine.equals("신분당선")){
							subwayItems.add(item);
						}
					}
			
				}
				
			}
			
			
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
		//if(subwayItems.size()==0)
			
	
	return subwayItems;
}		

//20160612(일) - 20160618(토) 다음api로 반경에서 제일 가까운 지하철 역을 구하고 서울시 공공데이터api로 해당 지하철 역에 대한 일-토까지 요일별 승하차인원을 구함
public SubwayItem subwayUrlByRequestDate(String lat, String lng, String requestDate, String subwayNameFinally, String subwayLine) {		

	StringBuilder sb=null;
	//서울시 공공데이터(지하철 일자별 승하차인원 )
	try {
		URL url = new URL("http://openapi.seoul.go.kr:8088/575a755572776f723733486e587745/json/CardSubwayStatsNew/1/1000/"+requestDate);
		 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	       conn.setRequestMethod("GET");
	       conn.setRequestProperty("Content-type", "application/json");
	       
	       Gson gson = new Gson();
	       BufferedReader rd;
		       
	       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       } else {
	           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	       }
	       
	       sb = new StringBuilder();
	       String line;
	       while ((line = rd.readLine()) != null) {
	           sb.append(line);
	       }
	       rd.close();
	       conn.disconnect();
	      
	       JsonParser parser = new JsonParser();
			JsonObject doc = parser.parse(sb.toString()).getAsJsonObject();
			JsonObject row = doc.getAsJsonObject("CardSubwayStatsNew");//{"channel":{...,items:[{...}]}}
			JsonArray items = row.getAsJsonArray("row");	
			
			////////////////////////////아래는 다음api를 이용하여 반경내 지하철 역 알아오기/////////////////////
			LocationPoint storePoint = new LocationPoint(lat, lng);
			
			//밑에는 서울시공공데이터 지하철역 이름과 승하차인원 items(서울시공공데이터는 신분당선이 없고 다음은 신분당선 있음 조심!!)
				for(int j=0; j<items.size(); j++){
					JsonObject element = items.get(j).getAsJsonObject();
					SubwayItem item = gson.fromJson(element, SubwayItem.class);
					if(subwayNameFinally.equals(item.getSUB_STA_NM())){//역명이 같은지 조회
						if(!subwayLine.equals("신분당선")){//신분당선역은 뺸다(서울시 공공데이터에 포함되어 있지 않음)
							return item;//역명이 같은걸 찾았을 경우
						}
					}
			
				}
			
				
			
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
		//if(subwayItems.size()==0)
			
	return null;//못찾았을 경우
}

//공공데이터포털api로 반경내 해당 업종코드로 유사 업종을 구함
public ArrayList<AroundStoreGongGong> getStoreListInRadiusDataByLargeUpjong (String UpjongCode, String radius, String smallOrMiddleOrLarge, String lat, String lng) {
	
		StringBuilder sb=new StringBuilder();
		ArrayList<AroundStoreGongGong> aroundStoreGongGongs = new ArrayList<>();
		
	try{   
		//indsLclsCd=업종대분류&indsMclsCd=업종중분류&indsSclsCd=업종소분류
		String largeUrl="http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?&indsLclsCd="+UpjongCode+"&radius="+radius+"&cx="+lng+"&cy="+lat+"&type=json&ServiceKey=tvGSgWQWisyXoGdlzgiHr1YA%2BoYRzGc9B8oeuXoEKoln9VLFRywemBaVcbPeINY6t9vaKlLb%2BUF%2Bs9YXlrES7w%3D%3D";
		String middleUrl="http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?&indsMclsCd="+UpjongCode+"&radius="+radius+"&cx="+lng+"&cy="+lat+"&type=json&ServiceKey=tvGSgWQWisyXoGdlzgiHr1YA%2BoYRzGc9B8oeuXoEKoln9VLFRywemBaVcbPeINY6t9vaKlLb%2BUF%2Bs9YXlrES7w%3D%3D";
		String smallUrl="http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?&indsSclsCd="+UpjongCode+"&radius="+radius+"&cx="+lng+"&cy="+lat+"&type=json&ServiceKey=tvGSgWQWisyXoGdlzgiHr1YA%2BoYRzGc9B8oeuXoEKoln9VLFRywemBaVcbPeINY6t9vaKlLb%2BUF%2Bs9YXlrES7w%3D%3D";
		URL url=null;
		
		//업종 코드가 대분류 or 중분류 or 소분류 조건
		if(smallOrMiddleOrLarge.equals("S")){
			url=new URL(smallUrl);
		}else if(smallOrMiddleOrLarge.equals("M")){
			url=new URL(middleUrl);		
		}else{
			url=new URL(largeUrl);		
		}
						
	       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	       conn.setRequestMethod("GET");
	       conn.setRequestProperty("Content-type", "application/json");
	       
	       BufferedReader rd;
		       
	       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       } else {
	           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	       }
	       
	       sb = new StringBuilder();
	       String line;
	       while ((line = rd.readLine()) != null) {
	           sb.append(line);
	       }
	       rd.close();
	       conn.disconnect();

	      
	       JsonParser parser = new JsonParser();
	       JsonObject doc = parser.parse(sb.toString()).getAsJsonObject();
	       JsonObject root = doc.getAsJsonObject("body");
	       JsonArray objArray = root.getAsJsonArray("items");
	       
	       Gson gson = new Gson();
	       
	       
	       for(int i=0; i<objArray.size(); i++){
	    	   JsonObject obj = objArray.get(i).getAsJsonObject();
	    	   AroundStoreGongGong  aroundStoreGongGong = gson.fromJson(obj, AroundStoreGongGong.class);
	    	   aroundStoreGongGongs.add(aroundStoreGongGong);
	       }

       
	}catch(Exception e){e.printStackTrace();}
	
	return aroundStoreGongGongs;
}		

	
	
		
@RequestMapping(value = "storeDetail.action", method = RequestMethod.GET)
public String searchStoreByStoreNo(Model model, @ModelAttribute Member member, HttpServletRequest req) {
		int storeNo = Integer.parseInt(req.getParameter("storeNo"));
		
		Member storemember = memberService.searchMemberByMemberNo(member.getMemberNo());
		Store store = memberService.searchStoreByStoreNo(storeNo);
		int salesMonthlyProfit = (int) (store.getSalesMonthly() - store.getSalesCost());
		int salesEarningsRate = Math.round(((float) salesMonthlyProfit / store.getSalesMonthly()) * 100);
		
		List<StoreImage> storeImages = memberService.searchStoreImagesByStoreNo(storeNo);

		model.addAttribute("storemember",storemember);
		model.addAttribute("store",store);
		model.addAttribute("salesMonthlyProfit", salesMonthlyProfit);
		model.addAttribute("salesEarningsRate", salesEarningsRate);
		model.addAttribute("storeImages",storeImages);
		model.addAttribute("storeNo",storeNo);
		
		Gson gson= new Gson();
		
		//주소 ->좌표 반환
		LocationPoint storePoint = getLocationPointByStoreAddress(store.getStoreAddress());
		String storePointJson = gson.toJson(storePoint);
		model.addAttribute("storePointJson", storePointJson);	
		
		
		
		return "member/detail";  	
}
	///공공api를 통해서 인근(사용자가 정의한 반경이 아님) 버스정류장 승하차인원 제공
	public ArrayList<BusStation> BusSttnInfoInqireService(String lat, String lng){
		StringBuilder sb= new StringBuilder();
		
		 ArrayList<BusStation> getBusStation = new ArrayList<>();
		
		try{   
			//indsLclsCd=업종대분류&indsMclsCd=업종중분류&indsSclsCd=업종소분류
			String getBusInfoByLatLng="http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?type=json&gpsLati="+lat+"&gpsLong="+lng+"&type=json&ServiceKey=tvGSgWQWisyXoGdlzgiHr1YA%2BoYRzGc9B8oeuXoEKoln9VLFRywemBaVcbPeINY6t9vaKlLb%2BUF%2Bs9YXlrES7w%3D%3D";
			URL url = new URL(getBusInfoByLatLng);
						
		       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		       conn.setRequestMethod("GET");
		       conn.setRequestProperty("Content-type", "application/json");
		       System.out.println("Response code: " + conn.getResponseCode());
		     	       
		       BufferedReader rd;
			       
		       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		       } else {
		           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		       }
		       
		       sb = new StringBuilder();
		       String line;
		       while ((line = rd.readLine()) != null) {
		           sb.append(line);
		       }
		       rd.close();
		       conn.disconnect();
		      		       
		       JSONObject arroundBusStationjson = XML.toJSONObject(sb.toString());
		      
		       JSONObject a = arroundBusStationjson.getJSONObject("response");
		       JSONObject b = a.getJSONObject("body");
		       JSONObject c = b.getJSONObject("items");
		       JSONArray array = c.getJSONArray("item");
		      
		       ArrayList<String> staitonNames = new ArrayList<>();
		       
		if(array.length() != 0){ //배열에 값이 없을 경우
		    	
		    	   for(int i=0; i<array.length(); i++){
			    	   
			       		JSONObject obj = (JSONObject) array.get(i);
			       		staitonNames.add(String.valueOf(obj.get("nodenm")));
			       		
			          }
		    	   
		    	   ArrayList<String> uniqueStaitonNames = new ArrayList<String>(new LinkedHashSet<String>(staitonNames));//LinkedHashSet으로 같은 값들을 제거
			       
			       int rideNum=0;
				   int alightNum=0;
			     
				   
			       for(int i=0; i<uniqueStaitonNames.size(); i++){
			    	   
			    	   String stationName = uniqueStaitonNames.get(i);
			    	   ArrayList<BusStation> busStations = memberService.getBusStationBybusStationName(stationName);
			    	  	
			    	   
			    	   if(busStations.size()!=0){ 
			    	  			    	   
				    	   for(int j=0; j<busStations.size(); j++){
				    		
				    		   rideNum = Integer.parseInt(busStations.get(j).getRIDE_PASGR_NUM());
							   alightNum = Integer.parseInt(busStations.get(j).getALIGHT_PASGR_NUM());
					    	   System.out.println(busStations.get(j).getRIDE_PASGR_NUM());
					    	  
							   rideNum += rideNum;
				    		   alightNum += alightNum;
				    		  
				    	   }
				    	   
				    	   BusStation busStation = new BusStation();
			    		   busStation.setRIDE_PASGR_NUM(String.valueOf(rideNum));
			    		   busStation.setALIGHT_PASGR_NUM((String.valueOf(alightNum)));
			    		   busStation.setBUS_STA_NM(busStations.get(i).getBUS_STA_NM());
			    		 	    		
			    		   getBusStation.add(busStation);
				       
			    	   }else{ //if(busStations.size()==0) END
			    		   BusStation busStation = new BusStation();
			    		   busStation.setBUS_STA_NM(stationName);
			    		   getBusStation.add(busStation); 
			    	   }
			    	   
			       }//for문 END
			   
		}else{
			getBusStation = null; 
		}
		       
       		       
	       
		}catch(Exception e){e.printStackTrace();}
	
		return getBusStation;
		
	}
	
    //사용자가 지도에 반경을 정의하고 클릭시 ajax로 통신하는 메서드
	@ResponseBody
	@RequestMapping(value = "getRadius.action")
		public String getRadius(String storeLat, String storeLng, String radius, String storeNo) {		
					
				LocationPoint storePoint = new LocationPoint(storeLat, storeLng);
		
				/* Hinterland Code(배후지 코드)
				MT1 : 대형마트
				CS2 : 편의점
				PS3 : 어린이집, 유치원
				SC4 : 학교
				AC5 : 학원
				PK6 : 주차장
				OL7 : 주유소, 충전소
				SW8 : 지하철역
				BK9 : 은행
				CT1 : 문화시설
				AG2 : 중개업소
				PO3 : 공공기관
				AT4 : 관광명소
				AD5 : 숙박
				FD6 : 음식점
				CE7 : 카페
				HP8 : 병원
				PM9 : 약국*/
				Gson gson = new Gson();
				
				String hinterlandCode = "PK6";//주차장
				ArrayList<AroundStore> aroundParks = (ArrayList<AroundStore>)getHinterlandByStorePoint(storePoint, hinterlandCode, radius);	
				String aroundParksJson = gson.toJson(aroundParks);
				System.out.println(aroundParksJson);
				
				String hinterlandCode2 = "AG2";//중개업소
				ArrayList<AroundStore> aroundAgencys = (ArrayList<AroundStore>)getHinterlandByStorePoint(storePoint, hinterlandCode2, radius);
				String aroundAgencysJson = gson.toJson(aroundAgencys);
				System.out.println(aroundAgencysJson);	
					
				String hinterlandCode3 = "SC4";//학교
				ArrayList<AroundStore> aroundSchools = (ArrayList<AroundStore>)getHinterlandByStorePoint(storePoint, hinterlandCode3, radius);
				String aroundSchoolsJson = gson.toJson(aroundSchools);
				System.out.println(aroundSchoolsJson);
				
				//가게번호를 통해서 오픈api에 업종분류 코드와 업종분류 종류를 얻음
				String middleNo = memberService.getMiddleNoByStoreNo(storeNo);
				String middleOrSmallOrLarge = memberService.getMiddleorsmallByMiddleNo(middleNo);
				String middlecode = memberService.getMiddlecodeByMiddleNo(middleNo);
				
				//상가업소 오픈api(공공데이터) - 유사업종 반환
				ArrayList<AroundStoreGongGong> aroundStoreGongGong = getStoreListInRadiusDataByLargeUpjong(middlecode, radius, middleOrSmallOrLarge, storeLat, storeLng);
				String aroundStoreGongGongJson = gson.toJson(aroundStoreGongGong);
				System.out.println(aroundStoreGongGongJson);
				
				//가게를 중심으로 반경내 2km내의 지하철역을 알아내 해당 지하철역의 승하차인원 반환(서울시 공공데이터)
				ArrayList<SubwayItem> subwayItems = subwayUrl(storeLat, storeLng);
				String subwayItemsJson = gson.toJson(subwayItems);
				System.out.println(subwayItemsJson);
				
				//20160612(일) - 20160618(토) - 요일별 지하철역 승하차인원 반환
				ArrayList<SubwayItem> dateSubwayItems = new ArrayList<>();
				String dateSubwayItemsJson = "";
				
				ArrayList<AroundStore> aroundSubway = (ArrayList<AroundStore>)getHinterlandByStorePoint(storePoint, "SW8", "2000");	
				if(aroundSubway.size() != 0){
					String[] subwayArray = aroundSubway.get(0).getTitle().split(" ");//가장 가까운 역을 위해서 index=0
					String subwayName= subwayArray[0];
					String subwayLine= subwayArray[1];
					String subwayNameFinally=subwayName.substring(0,subwayName.length()-1);
				
					for(int i=0; i<7; i++){
						SubwayItem dateSubwayItem = subwayUrlByRequestDate(storeLat, storeLng, String.valueOf(20160612+i), subwayNameFinally, subwayLine);//(일)
						dateSubwayItems.add(dateSubwayItem);
					}
					
					dateSubwayItemsJson = gson.toJson(dateSubwayItems);
					System.out.println(dateSubwayItemsJson);
				}else{
					dateSubwayItemsJson = null;
				}
								
				
				
				//인근 버스 정류장 승하차인원 반환
				ArrayList<BusStation> busStations = BusSttnInfoInqireService(storeLat, storeLng);
				String busStationsJson = gson.toJson(busStations);
				System.out.println(busStationsJson);
			
			return aroundParksJson+"|"+aroundAgencysJson+"|"+aroundSchoolsJson+"|"+subwayItemsJson+"|"+dateSubwayItemsJson+"|"+busStationsJson+"|"+aroundStoreGongGongJson;
	}
	/////////
	@RequestMapping(
			value = "upDataSellStatue.action", method = RequestMethod.POST)
		public String upDataSellStatue(
				@ModelAttribute Member member,int storeNo) {		
					memberService.upDataSellStatue(storeNo);			
		
			return "redirect:/storeDetail.action";
	}

	///////////////////////////////////////////////////////////////////////////////// 에이작스로
	///////////////////////////////////////////////////////////////////////////////// 작업시
	///////////////////////////////////////////////////////////////////////////////// 확인해야할
	///////////////////////////////////////////////////////////////////////////////// 구문
	@RequestMapping(value = "interestStore.action", method = RequestMethod.GET)
	public String interestStoreform(@ModelAttribute Member member, int memberNo, int storeNo) {

		return "redirect:/storeDetail.action";

	}

	@RequestMapping(value = "interestStore.action", method = RequestMethod.POST)
	@ResponseBody
	public String interestStore(@ModelAttribute Member member, String memberNos, String storeNos) {

		int memberNo = Integer.parseInt(memberNos);
		int storeNo = Integer.parseInt(storeNos);
		InterestStore interestStore = memberService.searchinterestStorekLike(memberNo, storeNo);
		if (interestStore == null) {
			memberService.interestStore(memberNo, storeNo);
			return "success";
		} else {
			return "fail";
		}
	}

	///////////////////////////////////////////////////////////////////////////////// 에이작스로
	///////////////////////////////////////////////////////////////////////////////// 작업시
	///////////////////////////////////////////////////////////////////////////////// 확인해야할
	///////////////////////////////////////////////////////////////////////////////// 구문
	@RequestMapping(value = "interststorelist.action", method = RequestMethod.GET)
	public String interststorelistform(Model model, @ModelAttribute Member member, int memberNo) {
		List<Store> stores = memberService.selectInterestStoreBymemberNo(memberNo);
		List<StoreImage> storeImages = memberService.searchStoreImagesByMemberNo();
		List<InterestStore> intereststores = memberService.allInterestStore();
		model.addAttribute("intereststores", intereststores);
		model.addAttribute("storeImages", storeImages);
		model.addAttribute("stores", stores);

		return "member/intereststorelist";
	}

	@RequestMapping(value = "interststorelist.action", method = RequestMethod.POST)
	public String interststorelist(Model model, @ModelAttribute Member member, int memberNo) {

		return "redirect:/member/intereststorelist";
	}
	
	//다음api로 주소를 통해 좌표 반환(lat, lng)
	public LocationPoint getLocationPointByStoreAddress(String storeAddress){
		
			///////////////////////////////////////밑에는 주소를 통해서 좌표값 얻어오기/////////////////////////
			String daumApi = "c6292734fec2c656a1ae18a9086544ba";
			LocationPoint storePoint=null;
			
			try {
			String encodedAddress=URLEncoder.encode(storeAddress,"UTF-8");
			String getPointByAddressUrl="https://apis.daum.net/local/geo/addr2coord?apikey="+daumApi+"&q="+encodedAddress+"&output=json";	
			
			URL url = new URL(getPointByAddressUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);//전송 메시지 본문에 데이터 쓰기 설정
			conn.setDoInput(true);//수신 메시지 읽기 설정
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			
			InputStream istream = conn.getInputStream();
			InputStreamReader reader =new InputStreamReader(istream);
			
						
			JsonParser parser = new JsonParser();
			JsonObject doc = parser.parse(reader).getAsJsonObject();
			JsonObject root = doc.getAsJsonObject("channel");//{"channel":{...,item:[{...}]}}
			JsonArray items = root.getAsJsonArray("item");
			
			Gson gson = new Gson();
			
			for (int i = 0; i <items.size(); i++) {
				JsonObject element = items.get(i).getAsJsonObject();
				storePoint = gson.fromJson(element, LocationPoint.class);//Json 문자열로부터 객체 생성
			}
			
			reader.close();
			istream.close();	
			
			} catch (Exception e) {
			
			e.printStackTrace();
			}
			
			return storePoint;
	}
	
    //매물 좌표를 통하여 반경내 카테고리별 배후지  반환
	public List<AroundStore> getHinterlandByStorePoint(LocationPoint storePoint, String hinterlandCode, String radius){
		
		////////////////////////////밑에는 좌표를 통해서 주변 주차장 불러오기///////////////////////
		
		String daumApi = "09f9640d9f08c86ae0312c049c36bbbf";
		
		String getAroundStoresByPoint = "https://apis.daum.net/local/v1/search/category.json?apikey="+daumApi+"&code="+hinterlandCode+"&location="+storePoint.getLat()+","+storePoint.getLng()+"&radius="+radius+"&sort=2";//반경400m,sort=2는 거리순
		ArrayList<AroundStore> aroundStores = new ArrayList<AroundStore>();
		
		try {
			URL url2 = new URL(getAroundStoresByPoint);
			
			HttpURLConnection conn = (HttpURLConnection)url2.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);//전송 메시지 본문에 데이터 쓰기 설정
			conn.setDoInput(true);//수신 메시지 읽기 설정
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			
			InputStream istream = conn.getInputStream();
			InputStreamReader reader =new InputStreamReader(istream);
			
			JsonParser parser = new JsonParser();
			JsonObject doc = parser.parse(reader).getAsJsonObject();
			JsonObject root = doc.getAsJsonObject("channel");
			JsonArray items = root.getAsJsonArray("item");
			
			Gson gson = new Gson();
		
		if(items.size() != 0){
			for (int i = 0; i <items.size(); i++) {
				JsonObject element = items.get(i).getAsJsonObject();
				AroundStore aroundStore =  gson.fromJson(element, AroundStore.class);//Json 문자열로부터 객체 생성
				
				aroundStores.add(aroundStore);		
			}
		}
		
		reader.close();
		istream.close();	
		
		} catch (IOException e) {
			e.printStackTrace();
	
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		return aroundStores;

	}	
	
	/////////////////////////////////////////////////////////////////////////////////

	// 내 매수 관리 파트

	@RequestMapping(value = "mybuylist.action", method = RequestMethod.GET)
	public String showMyBuyList(Model model, @ModelAttribute Member member, 
			@RequestParam(value="pageno", defaultValue="1") int pageNo, 
			HashMap<String, Integer> map) {
		
		int memberNo = member.getMemberNo();
		model.addAttribute("memberNo", memberNo);
		
		// 페이저
		int currentPage = pageNo;

		model.addAttribute("pageno", currentPage);

		int pageSize = 3;// 한 페이지에 표시할 항목 갯수
		int start = (currentPage - 1) * pageSize + 1;
		int last = start + pageSize;

		int total = memberService.getMybuylistCount(memberNo); // 회원의 구합니다 게시물 갯수 조회
		
		int pagerSize = 3;
		
		System.out.println(start + " / 끝: " + last + " /총 갯수 :" + total);

		ThePager pager = new ThePager();
		pager.setCurrentPage(currentPage);
		pager.setDataCount(total);
		pager.setLinkUrl("mybuylist.action");
		int pageCount = (total / pageSize) + ((total % pageSize) > 0 ? 1 : 0);
		pager.setPageCount(pageCount);
		pager.setPagerSize(pagerSize);
		pager.setPageSize(pageSize);

		model.addAttribute("pager", pager);

		// 목록 조회
		map.put("memberNo", memberNo);
		map.put("start", start);
		map.put("last", last);
		List<BuyStore> buyList = memberService.getBuyListByMemberNo(map);

		model.addAttribute("buyList", buyList);

		return "member/mybuylist";
	}


	@RequestMapping(
			value = "questionList.action", method = RequestMethod.GET)
		public String questionList(Model model,
				@RequestParam(value="pageno", defaultValue="1") int pageNo, HashMap<String, Integer> map,
				@ModelAttribute Member member) {	

		//페이저
		
			int memberNo = member.getMemberNo();
			model.addAttribute("memberNo", memberNo);
		
				int currentPage = pageNo;				
				model.addAttribute("pageno", currentPage);
				
				int pageSize = 3;//한 페이지에 표시할 항목 갯수
				int start = (currentPage - 1) * pageSize + 1;
				int last = start + pageSize;
				
				int total = memberService.getQuestionCount(memberNo); //회원의 문의 게시물 갯수 조회
				int pagerSize = 3;
				
				System.out.println(start + " / 끝: " + last + " /총 갯수 :" + total);
				
				ThePager pager = new ThePager();		
				pager.setCurrentPage(currentPage);
				pager.setDataCount(total);
				pager.setLinkUrl("questionList.action");
				int pageCount = (total / pageSize) + ((total % pageSize) > 0 ? 1 : 0); 
				pager.setPageCount(pageCount);
				pager.setPagerSize(pagerSize);
				pager.setPageSize(pageSize); 

				model.addAttribute("pager", pager);
		
		//목록 조회
			map.put("memberNo", member.getMemberNo());
			map.put("start", start);
			map.put("last", last);
			List<Question> questions = memberService.questionList(map);
			List<Member> allMember = memberService.allMember();
			List<Store> allStore = memberService.allstore();	
			
			model.addAttribute("questions", questions);
			model.addAttribute("allMember", allMember);
			
			return "member/questionList";

		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "intereststoreDeleted.action", method = RequestMethod.POST)
	@ResponseBody
	public String intereststoreDeleted(@ModelAttribute Member member, int intereststoreNo) {
		
		memberService.intereststoreDeleted(intereststoreNo);

		return "success";
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		@RequestMapping(value = "questionDeleted.action", method = RequestMethod.POST)
		@ResponseBody
		public String questionDeleted(@ModelAttribute Member member, int questionNo) {
	
		memberService.questionDeleted(questionNo);
		
		return "success";
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "storesellStatue.action", method = RequestMethod.POST)
	@ResponseBody
	public String storesellStatue(@ModelAttribute Member member, int storeNo) {
	memberService.storesellStatue(storeNo);
	
	return "success";
	}
}
