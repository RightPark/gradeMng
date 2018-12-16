package cmd.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.service.CmdService;
import cmd.vo.CmdVO;




@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{
    private final static Log logger = LogFactory.getLog(CmdController.class);
   
	@Resource(name = "cmdService")
	private CmdService cmdService;
	
	//메인페이지 호출
    @RequestMapping("/main.do")
    public String main(){      	  
    	return "main/main";	
    }

 

  
	// 로그인
	@RequestMapping(value = "/doMember_login.do")
	public ModelAndView doMember_login(HttpServletRequest req, HttpServletResponse res,
			@RequestParam Map<String, Object> pMap) throws Exception {

		ModelAndView output = new ModelAndView();
		Map<String, Object> rMap = new HashMap<String, Object>();
		int resultCode = 0;
		String resultMsg = "";
		try {
		
			CmdVO vo = this.cmdService.getMemberInfo(pMap);
		
			if (vo == null) {
				
				resultMsg = "ID 또는 비밀번호가 틀렸습니다.";
				resultCode = 0;
			} else{
			
				resultMsg = "로그인";
				resultCode = 1;
				HttpSession session = req.getSession(true);
				
				String username = vo.getUsername();
			
				rMap.put("username", username);
				
				rMap.put("userNo", vo.getUserNo());
				
				session.setAttribute("sessionData", rMap);
				
				session.setAttribute("username", username);
				
			}
	
			rMap.put("resultCode", resultCode);
			rMap.put("resultMsg", resultMsg);

		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		output.addAllObjects(rMap);
		output.setViewName("jsonView");

		return output;

	}
	//로그아웃
	@RequestMapping("/logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws Exception {

		//ModelAndView output = new ModelAndView();
		//ModelAndView mav = new ModelAndView("main/main");
		try {
			HttpSession session = req.getSession(true);
			Map<String, Object> sessionData = (Map<String, Object>) session.getAttribute("sessionData");

			if (sessionData != null) {
				session.removeAttribute("sessionData");
				session.invalidate();
				session = req.getSession(true);		
			}
			String cp = req.getContextPath();
			res.sendRedirect(cp + "/cmd/main.do");
		} catch (Exception e) {
			throw new Exception(e.toString());
		}

		
		
		//return output;
	}
		
	//정보 화면
		@RequestMapping(value="/info.do")
		public ModelAndView info(HttpServletRequest req, HttpServletResponse res,
	 			@RequestParam Map<String, Object> pMap) throws Exception {
			List<Object> list = null;

			list = cmdService.get_info_list(pMap);
			
			ModelAndView mav = new ModelAndView("main/info");
			mav.addObject("list", list);
		
			
			return mav;
			

		}
		
		//정보 화면
		@RequestMapping(value="/infoDetail.do")
		public ModelAndView infoDetail(HttpServletRequest req, HttpServletResponse res,
	 			@RequestParam Map<String, Object> pMap) throws Exception {
			List<Object> list = null;

			list = cmdService.get_info_Detail(pMap);
			
			ModelAndView mav = new ModelAndView("main/infoDetail");
			mav.addObject("list", list);
		
			
			return mav;
			

		}	
		
		//수강신청 호출
	    @RequestMapping("/apply.do")
	    public String apply(){      	  
	    	return "main/apply";	
	    }

		
		 // 수강신청
			@RequestMapping(value = "/insert_apply.do")
			public ModelAndView insert_apply(HttpServletRequest req, HttpServletResponse res,
					@RequestParam Map<String, Object> pMap) throws Exception {
				
				ModelAndView output = new ModelAndView();
				Map<String, Object> rMap = new HashMap<String, Object>();
				int result = 0;
				
				try {
					
					result = this.cmdService.insert_apply(pMap);
					
				} catch (Exception e) {
					throw new Exception(e.toString());
				}

				rMap.put("result", result);
				output.addAllObjects(rMap);
				output.setViewName("jsonView");

				return output;

			}
 	
			//정보 화면
			@RequestMapping(value="/applyList.do")
			public ModelAndView applyList(HttpServletRequest req, HttpServletResponse res,
		 			@RequestParam Map<String, Object> pMap) throws Exception {
				List<Object> list = null;

				list = cmdService.get_apply_list(pMap);
				
				ModelAndView mav = new ModelAndView("main/applyList");
				mav.addObject("list", list);
			
				
				return mav;
				

			}
}

