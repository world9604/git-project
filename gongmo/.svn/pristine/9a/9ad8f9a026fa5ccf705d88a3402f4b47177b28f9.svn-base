package com.mvcdemoweb.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mvcdemoweb.common.Util;
import com.mvcdemoweb.model.dto.AroundStore;
import com.mvcdemoweb.model.dto.AroundStoreGongGong;
import com.mvcdemoweb.model.dto.BusStation;
import com.mvcdemoweb.model.dto.BuyStore;
import com.mvcdemoweb.model.dto.BuyStoreQna;
import com.mvcdemoweb.model.dto.CategoryBig;
import com.mvcdemoweb.model.dto.CategoryMiddle;
import com.mvcdemoweb.model.dto.InterestStore;
import com.mvcdemoweb.model.dto.LocationPoint;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Question;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.dto.SubwayItem;
import com.mvcdemoweb.model.service.MemberServiceImpl;
import com.mvcdemoweb.model.service.StoreServiceImpl;
import com.mvcdemoweb.ui.ThePager;


@Controller
@RequestMapping(value = "/stores/")
public class StoreController {

	@Autowired
	@Qualifier("storeService")
	private StoreServiceImpl storeService;
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl memberService;
	
	
	@RequestMapping(value = "register.action", method = RequestMethod.GET)
	public String registerForm(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Member member, 
			Model model) {
		
		List<CategoryBig> categoryBigs = storeService.getCategoryBigList();
		List<CategoryMiddle> categoryMiddles = storeService.getCategoryMiddleList();
		
		model.addAttribute("categoryBigs", categoryBigs);
		model.addAttribute("categoryMiddles", categoryMiddles);
		
		return "store/registerform";
	}
	@RequestMapping(
		value = "register.action", method = RequestMethod.POST)
	public String register(
			@ModelAttribute Member member, Store store) {

		//중분류 번호로 명칭 검색후 삽입
		String name = storeService.getCategoryMiddleNameByMiddleNo(store.getMiddleNo());
		store.setType(name);
		
		storeService.insertStore(store);
			
		return "redirect:/stores/insertphoto.action";

	}
	
	//사진 등록
	@RequestMapping(value = "insertphoto.action", method = RequestMethod.GET)
	public String showRoomEditPhoto(HttpServletRequest request, @ModelAttribute Member member,
			Model model) {

		//등록한 가게번호 조회해서 변수에 저장 (사진등록에 사용)
		int storeNo = storeService.getStoreNoForInsertImage();
		
		model.addAttribute("storeNo", storeNo);
		
		return "store/insertphoto";

	}	
	@RequestMapping(value = "insertphoto.action", method = RequestMethod.POST)
	public String insertImage(MultipartHttpServletRequest mhsq, 
			@ModelAttribute Member member, StoreImage storeImage,
			int storeNo) {
		
		String path = mhsq.getRealPath("/resources/upload");// 실제 파일을 저장할 경로

		// UploadFile 테이블에 insert할 데이터를 저장할 객체
		// ArrayList<UploadFile> files = new ArrayList<>();
		try {
			List<MultipartFile> files = mhsq.getFiles("file-fr");
			if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {

			} else {
				for (int i = 0; i < files.size(); i++) {
					// 중복 명 처리

					// 본래 파일명
					String savedFileName = files.get(i).getOriginalFilename();
					
					//C:\\AAA\\BBB\\CCC.txt -> CCC.txt
					if (savedFileName.contains("\\")) {
						savedFileName = savedFileName.substring(
								savedFileName.lastIndexOf("\\") + 1);
					}
					
					// db에 저장되는 파일 이름(중복 안됨)
					String uploadFileName = Util.getUniqueFileName(path, savedFileName);
					
					File file = new File(path, uploadFileName);
					// 파일 저장
					files.get(i).transferTo(file);
					// 데이터 베이스에 저장하기
					storeImage.setSavedFileName(savedFileName);
					storeImage.setUploadFileName(uploadFileName);
					storeImage.setStoreNo(storeNo);
					//사진 경로(savedPath) 등록
					String imagePath = "http://210.16.214.202:8085/gongmo/resources/upload/" + uploadFileName;
					System.out.println(imagePath);
					storeImage.setSavedPath(imagePath);
					storeService.insertImage(storeImage);

				}
			}			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return "redirect:/home.action";

	}
	
	///////////////////////////////////////////////////////////////////////
		
		
	//안드로이드 통신 가게 리스트
		//가게 리스트 
		@ResponseBody
		@RequestMapping(value = "android.action")
			public String android(Model model, HttpServletRequest req, HttpServletResponse resp) {		
			
			//안드로이드로부터 가게리스트 요청이 있으면 아래 수행
		if(req.getParameter("androidRequest") != null){		
			//안드로이드가 실행 되면 androidRequest라는 파라미터를 전달 받음
			String androidRequest = req.getParameter("androidRequest");
							
			System.out.println("sssssss");
			
			
			if(androidRequest.equals("start")){
				
				System.out.println("success");			
				resp.setContentType("text/plain;charset=utf-8");//응답 컨텐츠의 종류
				
				ArrayList<Store> stores = (ArrayList<Store>)storeService.selectAllStoreListAndImage();
								
		        	Gson gson =new Gson();				
					String json = gson.toJson(stores);					
											
					return json;
				
			}else{
				System.out.println("fail");
				return "fail";
			}
		}
		return "fail";
}
	
		//안드로이드 통신 가게 리스트
				//가게 리스트 
	@ResponseBody
	@RequestMapping(value = "searchStore.action")
	public String searchStore(HttpServletResponse resp, String s_sido, String s_gugun, String s_leaseOrDealing, String s_upjongBig, String s_upjongSmall) {	
		
		System.out.println("searchStore sucess!!!!");
		 
		resp.setContentType("text/plain;charset=utf-8");
		
			Gson gson=new Gson();
			
			if(s_upjongSmall.equals("업종 소분류") & s_gugun.equals("구/군")){
				List<Store> stores = storeService.searchlistByleaseOrDealing(s_leaseOrDealing);
				String json = gson.toJson(stores);
				System.out.println(json);
				return json;
			}else if (!s_upjongSmall.equals("업종 소분류")&s_gugun.equals("구/군")) {
				List<Store> stores = storeService.searchlistByleaseOrDealingAndName(s_leaseOrDealing,s_upjongSmall);
				String json = gson.toJson(stores);
				System.out.println(json);
				return json;
			}else if(s_upjongSmall.equals("업종 소분류")&!s_gugun.equals("구/군")){
				List<Store> stores = storeService.searchlistByleaseOrDealingAndstoreAddress(s_leaseOrDealing,s_gugun);
				String json = gson.toJson(stores);
				System.out.println(json);
				return json;
			}else{
				List<Store> stores = storeService.searchlist(s_leaseOrDealing,s_upjongSmall,s_gugun);
				String json = gson.toJson(stores);
				System.out.println(json);
				if(stores != null){
					return json;
				}
				return json;

					
			}		

	}

	///////////////////////////////////////////////////////////////////////////////////////////////
	//가게 구합니다 부분
	
	//등록
	@RequestMapping(value = "buyregister.action", method = RequestMethod.GET)
	public String buyRegisterForm(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Member member, 
			Model model) {
		
		List<CategoryBig> categoryBigs = storeService.getCategoryBigList();
		List<CategoryMiddle> categoryMiddles = storeService.getCategoryMiddleList();
		ArrayList<String> sidos = (ArrayList<String>)storeService.getSidoByLocation();
		model.addAttribute("categoryBigs", categoryBigs);
		model.addAttribute("categoryMiddles", categoryMiddles);
		model.addAttribute("sidos", sidos);
		return "store/buyregisterform";
	}
	@RequestMapping(
		value = "buyregister.action", method = RequestMethod.POST)
	public String buyRegister(
			@ModelAttribute Member member, 
			int memberNo, String name,
			BuyStore buyStore) {	
		
		buyStore.setMemberNo(memberNo);
		buyStore.setWriter(name);
		storeService.insertBuyStore(buyStore);
			
		return "redirect:/stores/buylist.action";

	}
	
	//목록
	@RequestMapping(
		value = "buylist.action", method = RequestMethod.GET)
	public String buyStoreList(
			@ModelAttribute Member member, 
			@RequestParam(value="pageno", defaultValue="1") int pageNo, HashMap<String, Integer> map,
			BuyStore buyStore, Model model) {	
		
		//페이저
		int currentPage = pageNo;
		
		model.addAttribute("pageno", currentPage);
		
		int pageSize = 3;//한 페이지에 표시할 항목 갯수
		int start = (currentPage - 1) * pageSize + 1;
		int last = start + pageSize;
		
		int total = storeService.getBuyStoreCount(); //전체 구합니다 게시물 갯수 조회
		int pagerSize = 3;
		
		ThePager pager = new ThePager();		
		pager.setCurrentPage(currentPage);
		pager.setDataCount(total);
		pager.setLinkUrl("buylist.action");
		int pageCount = (total / pageSize) + ((total % pageSize) > 0 ? 1 : 0); 
		pager.setPageCount(pageCount);
		pager.setPagerSize(pagerSize);
		pager.setPageSize(pageSize); 

		model.addAttribute("pager", pager);
		
		//목록 조회
		map.put("start", start);
		map.put("last", last);
		List<BuyStore> buyStores = storeService.getBuyStoreList(map);
		
		model.addAttribute("buyStores", buyStores);
			
		return "store/buylist";

	}
	
	//상세보기	
	@RequestMapping(
		value = "buydetail.action", method = RequestMethod.GET)
	public String buyStoreDetail(
			@ModelAttribute Member member,
			@RequestParam("buyStoreNo") int buyStoreNo,
			BuyStore buyStore, BuyStoreQna buyStoreQna, Model model) {	
		
		buyStore = storeService.getDetailByBuyStoreNo(buyStoreNo);
		List<BuyStoreQna> buyStoreQnas = storeService.getBuyStoreQnas(buyStoreNo);
		buyStore.setBuyStoreQnas(buyStoreQnas);
			
		Member storeMember = memberService.searchMemberByMemberNo(buyStore.getMemberNo());
		String categoryName = storeService.getCategoryMiddleNameByMiddleNo(buyStore.getMiddleNo());

		model.addAttribute("buyStore", buyStore);		
		model.addAttribute("buyStoreQnas", buyStoreQnas);
		model.addAttribute("storeMember", storeMember);
		model.addAttribute("categoryName", categoryName);
			
		return "store/buydetail";

	}
	
	////////////////////////////////////////////////////////////////////
	
	//qna영역
	
	//구합니다 qna 등록
	@RequestMapping(
			value = "registerbuyqna.action", method = RequestMethod.POST)
	public String registerBuyQna(
			BuyStoreQna buyStoreQna, Model model,
			int memberNo, String name) {

		//작성자 삽입
		buyStoreQna.setMemberNo(memberNo);
		buyStoreQna.setWriter(name);

		storeService.registerBuyQna(buyStoreQna);
	
		return "redirect:/stores/buydetail.action?buyStoreNo=" + buyStoreQna.getBuyStoreNo();
	}
	
	//구합니다 qna 삭제
	@RequestMapping(
			value = "deletebuyqna.action", method = RequestMethod.GET)
	public String deleteBuyQna(
			int buyStoreQnaNo, int buyStoreNo) {	
		
		storeService.deleteBuyQna(buyStoreQnaNo);
		
		return "redirect:/stores/buydetail.action?buyStoreNo=" + buyStoreNo;
	}
	
	//구합니다 qna 등록
	@RequestMapping(
			value = "registerbuyqnareply.action", method = RequestMethod.POST)
	public String registerBuyQnaReply(
			BuyStoreQna buyStoreQna, Model model,
			int memberNo, String name,
			HashMap<String, Integer> map) {
		
		//부모 qna 조회
		BuyStoreQna parent = storeService.getBuyQnaByBuyQnaNo(
													buyStoreQna.getBuyStoreQnaNo());
		
		//step 업데이트
		map.put("qnaGroup", parent.getQnaGroup());
		map.put("qnaStep", parent.getQnaStep());
		storeService.updateStep(map);
		
		//답글 삽입
		//qnaGroup는 부모qna와 동일, qnaStep와 qnaDepth는 한 단계 + 되어야 함
		buyStoreQna.setQnaGroup(parent.getQnaGroup());
		int newStep = parent.getQnaStep() + 1;
		int newDepth = parent.getQnaDepth() + 1;
		buyStoreQna.setQnaStep(newStep);
		buyStoreQna.setQnaDepth(newDepth);
		
		
		//작성자 삽입
		buyStoreQna.setMemberNo(memberNo);
		buyStoreQna.setWriter(name);
		
		storeService.registerBuyQnaReply(buyStoreQna);
	
		return "redirect:/stores/buydetail.action?buyStoreNo=" + buyStoreQna.getBuyStoreNo();
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	
	
	//카테고리 빅을 통해 카테고리 미들을 구함(ajax 통신)
		@ResponseBody
		@RequestMapping(value = "getCategoryMiddleByCategoryBigNo.action", method = RequestMethod.GET, 
					    produces = "application/json; charset=utf8")//ResponseBody로 브라우저에 데이터를 보낼때 한글깨짐을 막기위해서 utf-8로 인코딩
		public String getCategoryMiddleByCategoryBigNo(Integer categoryBigNo, HttpServletResponse resp) {
			
			resp.setContentType("text/html;charset=UTF-8");
			List<CategoryMiddle> categoryMiddles= storeService.getCategoryMiddleByBigNo(categoryBigNo);
			
			Gson gson=new Gson();
			
			String json = gson.toJson(categoryMiddles);
			
			return json;
		}
		
		
		//시/도를 통해 구/군을 구함(ajax 통신)
				@ResponseBody
				@RequestMapping(value = "getGuGunBySido.action", method = RequestMethod.GET, 
							    produces = "application/json; charset=utf8")//ResponseBody로 브라우저에 데이터를 보낼때 한글깨짐을 막기위해서 utf-8로 인코딩
				public String getGuGunBySido(String locationSido, HttpServletResponse resp) {
					
					resp.setContentType("text/html;charset=UTF-8");
					List<String> guguns= storeService.getGuGunBySido(locationSido);
					
					Gson gson=new Gson();
					
					String json = gson.toJson(guguns);
					
					return json;
				}
	
				@RequestMapping(value = "storeBuyDetail.action", method = RequestMethod.GET)
				public String storeBuyDetail (Model model,
						@ModelAttribute Member member, HttpServletRequest req) {	
					int storeNo= Integer.parseInt(req.getParameter("storeNo"));
					int memberNo=Integer.parseInt(req.getParameter("memberNo"));
					
					
					Member storemember = memberService.searchMemberByMemberNo(memberNo);
					Store store = memberService.searchStoreByStoreNo(storeNo);
					//월 수익, 수익률 계산 후 뿌려주기
					int salesMonthlyProfit = (int) (store.getSalesMonthly() - store.getSalesCost());
					int salesEarningsRate = Math.round(((float) salesMonthlyProfit / store.getSalesMonthly()) * 100);
					List<StoreImage> storeImages = memberService.searchStoreImagesByStoreNo(storeNo);
					InterestStore interestStore	= memberService.searchinterestStorekLikelonmemberNo(member.getMemberNo(),storeNo);
					
					model.addAttribute("storemember",storemember);
					model.addAttribute("store",store);
					model.addAttribute("salesMonthlyProfit", salesMonthlyProfit);
					model.addAttribute("salesEarningsRate", salesEarningsRate);
					model.addAttribute("storeImages",storeImages);
					model.addAttribute("interestStore",interestStore);

					//주소 ->좌표 반환
					LocationPoint storePoint = getLocationPointByStoreAddress(store.getStoreAddress());
					Gson gson = new Gson();
					String storePointJson = gson.toJson(storePoint);
					model.addAttribute("storePointJson", storePointJson);	
					model.addAttribute("storeNo",storeNo);

					return "storebuy/detail";
				}
/////////////////////////////////////////////////////////////////////////////////에이작스로 작업시 확인해야할 구문	

				
				@RequestMapping(value = "searchlist.action", method =RequestMethod.POST,produces = "application/json; charset=utf8")
				@ResponseBody
				public String searchlist(Model model,@ModelAttribute Member member,String leaseOrDealing,String name,String storeAddress,HttpServletResponse resp) {		
					resp.setContentType("text/html;charset=UTF-8");
					Gson gson=new Gson();
					String name1 = "업종세분류 선택";
					String storeAddress1 = "구/군";
					
					if(name.equals(name1) & storeAddress.equals(storeAddress1)){
						List<Store> stores = storeService.searchlistByleaseOrDealing(leaseOrDealing);
						String json = gson.toJson(stores);
						return json;
					}else if (!name.equals(name1)&storeAddress.equals(storeAddress1)) {
						List<Store> stores = storeService.searchlistByleaseOrDealingAndName(leaseOrDealing,name);
						String json = gson.toJson(stores);
						return json;
					}else if(name.equals(name1)&!storeAddress.equals(storeAddress1)){
						List<Store> stores = storeService.searchlistByleaseOrDealingAndstoreAddress(leaseOrDealing,storeAddress);
						String json = gson.toJson(stores);
						return json;
					}else{
						List<Store> stores = storeService.searchlist(leaseOrDealing,name,storeAddress);
						String json = gson.toJson(stores);
						if(stores != null){
							return json;
						}
						return json;
							
					}		
					}
/////////////////////////////////////////////////////////////////////////////////에이작스로 작업시 확인해야할 구문
				
				@RequestMapping(value = "question.action", method = {RequestMethod.POST})
				@ResponseBody
					public String insertQuestionPost(
							@ModelAttribute Member member, Question question) {		
						storeService.insertQuestion(question);
						return "success";

					}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				@RequestMapping(value = { "allStroreList.action" }, method = RequestMethod.GET)
				public String home(Locale locale, Model model, @ModelAttribute Member member) {		
					
					//가게 대분류 중분류 검색 목록을 얻어옴
					ArrayList<CategoryBig> categoryBigs = (ArrayList<CategoryBig>)storeService.getCategoryBigAndCategoryMiddleList();
					ArrayList<String> sidos = (ArrayList<String>)storeService.getSidoByLocation();
					//전체 가게 목록과 이미지 목록을 가지고 와서 매인 홈페이지에 보여주는 구문
					List<Store> stores = memberService.allstore();					
					List<StoreImage> storeImages =  memberService.searchStoreImagesByMemberNo();

					model.addAttribute("stores", stores);
					model.addAttribute("storeImages", storeImages);
					model.addAttribute("categoryBigs", categoryBigs);
					model.addAttribute("sidos", sidos);
					
					return "/store/allStoreList"; // /WEB-INF/views/ + index + .jsp
				}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				@RequestMapping(value = "buystoreDeleted.action", method = RequestMethod.POST)
				@ResponseBody
				public String buystoreDeleted(@ModelAttribute Member member, int buystoreNo) {
				
					storeService.buystoreDeleted(buystoreNo);
				
				return "success";
			}

///////////////////////////////////////////////////////////////////memberController//////
						
			
				
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
					
			
				
}
