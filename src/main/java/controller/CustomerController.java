package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessHandle.Info;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.spi.RegisterableService;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
	private ServletContext ctx;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		dao = new CustomerDAO();
		ctx = getServletContext();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		String site = null;
		
		System.out.println("command : " + command);
		
		switch (command) {
		case "/list": site = getList(request); break;
		case "/info": site = getInfo(request); break;
		case "/register": site = "register.jsp"; break;
		case "/insert": site = insertCustomer(request); break;
		case "/edit": site = getInfoForEdit(request); break;
		case "/update": site = updateCustomer(request); break;
		case "/delete": site = deleteCustomer(request); break;
		}
		
		if (site.startsWith("redirect:/")) {
			String rview = site.substring("redirect:/".length());
			response.sendRedirect(rview);
		} else {
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}
	}
	
	// CustomerDAO 객체의 getList() 메소드 실행 : 고객 전체 리스트를 가져온 후 request 객체에 넣어준다.
	public String getList(HttpServletRequest request) {
		List<Customer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("customerList", list); // 고객 전체 리스트가 들어있는 list를 customerList에 담아 보낸다.
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "고객 목록을 정상적으로 불러오지 못했습니다.");
		}
		
		return "list.jsp";
	}
	
	// 고객의 상세정보를 가지고와서 request 객체에 넣어준다.
	public String getInfo(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getInfo(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "해당 고객 정보를 정상적으로 가져오지 못했습니다.");
		}
		
		return "info.jsp";
	}
	
	// 고객 등록
	public String insertCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				c.setImg("/img/" + fileName);
			} else {
				c.setImg(null);
			}
			
			dao.insertCustomer(c);
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				String encodeName = URLEncoder.encode("고객이 정상적으로 등록되지 않았습니다.", "UTF-8");
				return "redirect:/list?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/list";
	}
	
	// 고객 삭제
	public String deleteCustomer(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			dao.deleteCustomer(id);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				String encodeName = URLEncoder.encode("고객 정보가 정상적으로 삭제되지 않았습니다.", "UTF-8");
				return "redirect:/list?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/list";
	}
	
	// 수정할 고객의 기존 정보를 가지와 와서 request 객체에 넣어준다.
	public String getInfoForEdit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getInfo(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "edit.jsp";
	}
	
	// 고객 정보 수정
	public String updateCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		String origin_file = request.getParameter("origin_file");
		
		try {
			BeanUtils.populate(c, request.getParameterMap());
			
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			
			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				c.setImg("/img/" + fileName);
			} else { // 업로드된 이미지가 없을때
				if (origin_file == null || origin_file.equals("")) {
					c.setImg(null);
				} else {
					c.setImg(origin_file);
				}
			}
			
			dao.updateCustomer(c);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				String encodeName = URLEncoder.encode("고객 정보가 정상적으로 수정되지 않았습니다.", "UTF-8");
				return "redirect:/info?id=" + c.getId() + "&error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/info?id=" + c.getId();
	}
	
	// 파일에서 이미지명을 추출하는 메소드
	private String getFilename(Part part) {
		String fileName = null;
		
		// 파일 이름이 들어있는 헤더 영역을 가지고 옴
		String header = part.getHeader("content-disposition");
		
		// 파일 이름이 들어있는 속성 부분의 시작 위치(인덱스 번호)를 가지고 옴
		int start = header.indexOf("filename=");
		
		// 쌍따옴표 사이의 이미지명 부분만 가지고 옴
		fileName = header.substring(start + 10, header.length() - 1);
		
		return fileName;
	}
}
