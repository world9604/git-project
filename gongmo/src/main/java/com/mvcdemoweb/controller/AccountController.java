package com.mvcdemoweb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvcdemoweb.common.Util;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.service.MemberServiceImpl;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl memberService;
	
	
/*	@RequestMapping(
		value = "/login.action", method = RequestMethod.GET)
	public String loginForm(@ModelAttribute Member member) {
		return "account/loginform";
	}*/
	
	
	@RequestMapping(
		value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public String login(
		String email, String password, HttpSession session,Model model,@ModelAttribute Member member) {

		password = Util.getHashedString(password, "SHA-256");
		member = memberService.getMemberByEmailAndPasswd(email, password);
		
		if (member != null) {
			//세션에 로그인 정보 저장
			session.setAttribute("loginuser", member);
			return "success";
			/*return "redirect:/home.action";*/ 
		} else {
			
			
			return "false";
			/*return "index";*/
		}		
	}
	
	@RequestMapping(
		value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session,@ModelAttribute Member member) {
		
		session.removeAttribute("loginuser");//로그아웃
		return "redirect:/home.action";
	}
}
