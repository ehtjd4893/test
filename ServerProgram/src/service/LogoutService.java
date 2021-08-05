package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.MemberDTO;
import domain.ModelAndView;
import repository.MemberRepository;

public class LogoutService implements MemberService {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession().invalidate();
		
		return new ModelAndView(true, "login.jsp");
	}

}
