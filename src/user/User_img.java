package user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/User_img")
public class User_img extends HttpServlet {
	
		ServletRequest session;
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		
		int fileMaxSize = 10*1024*1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\","/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {}
		
		String userID = multi.getParameter("u_id");
		
		String fileName = "";
		File file = multi.getFile("u_img");
		if (file !=null) {
			String ext =file.getName().substring(file.getName().lastIndexOf("."+1));
			if(ext.equals("jpg")||ext.contentEquals("png")||ext.equals("gif")) {
								
			User2DAO user2DAO = new User2DAO();
			ArrayList<User2> list = user2DAO.getUserinfo((String) session.getAttribute("u_id"));
			String prev = list.get(0).getU_img();
			 
			File prevFile = new File(savePath + "/"+prev);
			if(prevFile.exists()) {
				prevFile.delete();
			}
			fileName=file.getName();
			} else {
				if(file.exists()) {
					file.delete();
				}
				
				session.setAttribute("messageType", "오류메시지");
				session.setAttribute("messageContent", "이미지 파일만 업로드 가능합니다.");
				response.sendRedirect("join.jsp");
				return;
			}
				
		}
		new User2DAO().profile(userID, fileName);
		session.setAttribute("messageType", "성공메시지");
		session.setAttribute("messageContent", "사진이 업로드 되었습니다.");
		response.sendRedirect("join.jsp");
		return;
		
		
	}

}
