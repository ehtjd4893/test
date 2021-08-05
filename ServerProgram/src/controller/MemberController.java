package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MemberDTO;
import domain.ModelAndView;
import service.LoginService;
import service.LogoutService;
import service.MemberListService;
import service.MemberService;
import service.UpdateService;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 어떤 요청인지 확인하기
		request.setCharacterEncoding("utf-8");
		//request.getRequestURI() == localhost:9090/ServerProgram/list.do
		String[] array = request.getRequestURI().split("/");
		String cmd = array[array.length - 1];
		
		MemberService memberService = null;
		ModelAndView mav = null;
		switch(cmd) {
		case "list.do":
			memberService = new MemberListService();
			mav = memberService.execute(request, response);			
			break;
		case "loginPage.do":
			mav = new ModelAndView(true, "login.jsp");
			break;
		case "login.do":
			memberService = new LoginService();
			mav = memberService.execute(request, response);
			break;
		case "logout.do":
			memberService = new LogoutService();
			mav = memberService.execute(request, response);
			break;
		case "update.do":
			memberService = new UpdateService();
			mav = memberService.execute(request, response);
			break;
		}
		
		if(mav != null) {
			if(mav.isRedrirect()) {
				response.sendRedirect(mav.getView());
			}
			else {
				request.getRequestDispatcher(mav.getView()).forward(request, response);
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
