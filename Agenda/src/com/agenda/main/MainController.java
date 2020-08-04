package com.agenda.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.agenda.login.LoginDao;
import com.agenda.login.LoginDto;


@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("");
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		HttpSession session = request.getSession();
		LoginDto logindto = (LoginDto) session.getAttribute("dto");
		
		LoginDao dao = new LoginDao();
		
		if(command.equals("mediSearch")) {
			response.sendRedirect("medisearch/mediSearch.jsp");
		}else if(command.equals("mediLocker")) {
			response.sendRedirect("medilockerscan/mediLockerScanMain.jsp");
		}else if(command.equals("findPharm")) {
			response.sendRedirect("pharmacy_map/pharmacy_map.jsp");
		}else if(command.equals("notice")){
			
		}else if(command.equals("qna")) {
			if (logindto != null) {
				
			String member_id =  logindto.getMember_id();
			String member_pw = logindto.getMember_pw();
			System.out.println(member_id + " " +member_pw);
			
			LoginDto input = new LoginDto(member_id, member_pw);
			logindto = dao.login(input);
			
			session.setAttribute("logindto", logindto);
			session.setMaxInactiveInterval(10 * 60);
			
			dispatch("qna/index.jsp", request, response);
			
			} else {
			
			response.sendRedirect("qna/index.jsp");
			}
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String alert = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		response.getWriter().append(alert);
	}


}
