package com.mvcdemoweb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvcdemoweb.model.dto.CategoryBig;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Store;
import com.mvcdemoweb.model.dto.StoreImage;
import com.mvcdemoweb.model.service.MemberServiceImpl;
import com.mvcdemoweb.model.service.StoreServiceImpl;

@Controller
public class HomeController {
		
	@Autowired
	@Qualifier("storeService")
	private StoreServiceImpl storeService;
	
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl memberService;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home1(Locale locale, Model model) {		
//		return "index"; // /WEB-INF/views/ + index + .jsp
//	}	
//	@RequestMapping(value = "/home.action", method = RequestMethod.GET)
//	public String home2(Locale locale, Model model) {		
//		return "index"; // /WEB-INF/views/ + index + .jsp
//	}	
	//2개 이상의 경로를 배열로 묶어서 매핑 가능
	@RequestMapping(value = { "/", "home.action" }, method = RequestMethod.GET)
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
		
		return "index"; // /WEB-INF/views/ + index + .jsp
	}	
	
	
}




