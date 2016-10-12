package com.mvcdemoweb.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mvcdemoweb.common.Util;
import com.mvcdemoweb.model.dto.Member;
import com.mvcdemoweb.model.dto.Notice;
import com.mvcdemoweb.model.service.MemberServiceImpl;
import com.mvcdemoweb.model.service.NoticeServiceImpl;
import com.mvcdemoweb.ui.ThePager;


@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {

	@Autowired
	@Qualifier("noticeService")
	private NoticeServiceImpl noticeService;
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl memberService;
	
	
	//등록
	@RequestMapping(value = "noticeregister.action", method = RequestMethod.GET)
	public String noticeRegisterForm(
			// 스프링 태그 라이브러리를 사용하기 위해 구성한 전달인자
			@ModelAttribute Member member, 
			Model model) {
		
		return "notice/registerform";
	}
	@RequestMapping(value = "noticeregister.action", method = RequestMethod.POST)
	public String noticeRegister(
			@ModelAttribute Member member, 
			Notice notice,MultipartHttpServletRequest mhsq) {	
		
		notice.setMemberNo(member.getMemberNo());
		notice.setWriter(member.getName());
		// 1. 전송데이터 읽기
				//int noroom = Integer.valueOf(roomNo);
				//System.out.println(mhsq);

				String path = mhsq.getRealPath("/resources/upload/notice");// 실제 파일을 저장할 경로


				// UploadFile 테이블에 insert할 데이터를 저장할 객체
				// ArrayList<UploadFile> files = new ArrayList<>();
				try {
					List<MultipartFile> files = mhsq.getFiles("file-fr");
					if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {

					} else {
						for (int i = 0; i < files.size(); i++) {
							// 중복 명 처리

							// 본래 파일명
							String uploadFileName = files.get(i).getOriginalFilename();
							
							//C:\\AAA\\BBB\\CCC.txt -> CCC.txt
							if (uploadFileName.contains("\\")) {
								uploadFileName = uploadFileName.substring(
										uploadFileName.lastIndexOf("\\") + 1);
							}
							
							// 저장되는 파일 이름(중복 안됨)
							String savedFileName = Util.getUniqueFileName(path, uploadFileName);
							System.out.println(savedFileName);
							File file = new File(path, savedFileName);
							// 파일 저장
							
							files.get(i).transferTo(file);
							// 데이터 베이스에 저장하기
							notice.setSavedFileName(savedFileName);
							notice.setUploadFileName(uploadFileName);
						}
					}
					// }
				} catch (Exception ex) {
					ex.printStackTrace();
				}
		noticeService.insertNotice(notice);
			
		return "redirect:/notice/noticelist.action";

	}
	
	//목록
	@RequestMapping(value = "noticelist.action", method = RequestMethod.GET)
	public String noticeList(
			@ModelAttribute Member member, 
			@RequestParam(value="pageno", defaultValue="1") int pageNo, HashMap<String, Integer> map,
			Notice notice, Model model) {	
		
		//페이저
		int currentPage = pageNo;
				
		model.addAttribute("pageno", currentPage);
		
		int pageSize = 3;//한 페이지에 표시할 항목 갯수
		int start = (currentPage - 1) * pageSize + 1;
		int last = start + pageSize;
		
		int total = noticeService.getNoticeCount(); //전체 공지 갯수 조회
		int pagerSize = 3;
				
		ThePager pager = new ThePager();		
		pager.setCurrentPage(currentPage);
		pager.setDataCount(total);
		pager.setLinkUrl("noticelist.action");
		int pageCount = (total / pageSize) + ((total % pageSize) > 0 ? 1 : 0); 
		pager.setPageCount(pageCount);
		pager.setPagerSize(pagerSize);
		pager.setPageSize(pageSize); 

		model.addAttribute("pager", pager);
		
		//목록 조회
		map.put("start", start);
		map.put("last", last);
		List<Notice> notices = noticeService.getNoticeList(map);
		
		model.addAttribute("notices", notices);
			
		return "notice/list";

	}
	
	//상세보기	
	@RequestMapping(value = "noticedetail.action", method = RequestMethod.GET)
	public String noticeDetail(
			@ModelAttribute Member member,
			@RequestParam("noticeNo") int noticeNo,
			Notice notice , Model model) {	
		
		notice = noticeService.getDetailByNoticeNo(noticeNo);
		
		model.addAttribute("notice", notice);
			
		return "notice/detail";

	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "noticeDeleted.action", method = RequestMethod.POST)
	@ResponseBody
	public String noticeDeleted(@ModelAttribute Member member, int noticeNo) {
	
		noticeService.noticeDeleted(noticeNo);
	
	return "success";
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*	@RequestMapping("fileDownload.action")
	public String fileDonwLoadSample(ModelMap model,String uploadFileName) throws Exception{
	 
	  model.put("fileName", uploadFileName);
	  model.put("filePath", "c:\\");
	  return "fileDownLoadView";
	}*/
	
	@RequestMapping(
			value = "fileDownload.action", method = RequestMethod.GET)
		public ModelAndView download(String uploadFileName,String savedFileName) {
		
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("uploadFileName", uploadFileName);
			map.put("savedFileName", savedFileName);
			mav.addObject(map);
			DownloadView dv = new DownloadView();
			dv.setAttributesMap(map);
			mav.setView(dv);
			return mav;
		}
	
}
