package Servlet;
 
import java.io.File;
import java.io.IOException;
 



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part; 

import util.ExcelReader;
 
@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadServlet extends HttpServlet {
 
    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "uploadFiles";
     
    /**
     * handles file upload
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets absolute path of the web application
        String appPath = request.getSession().getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
         
        String fileName="";
        
        for (Part part : request.getParts()) {
        	fileName = extractFileName(part);
            part.write(savePath + File.separator + fileName);
        }
 
        ExcelReader ss=new ExcelReader();
        
        System.out.print("--"+savePath + File.separator +fileName);
        
		String aa1=ss.getTextFromExcel(savePath + File.separator +fileName);
        
		/////////////////////////////////////////////////
		
		
		
		
		
		
		//ArrayList<String> dd = new ArrayList<String>();
		String[] dd =aa1.split("[\n]") ; 
		 
		
		///////////////////////////////////////////////////////
		
		
		String forward; 
		HttpSession session = request.getSession(true); // ʹ��session֮ǰ�ĳ�ʼ�� 
		session.setAttribute("projectlist3", dd); // ��projectlist����pro_query.jsp
		forward = "webAddressConfig.jsp"; // ������ת������ҳ

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response); // ��ת����Ŀչʾ����
		
		
		
		
		
		
		
        
       /* request.setAttribute("message", "Upload has been done successfully!");
        getServletContext().getRequestDispatcher("/message.jsp").forward(
                request, response);*/
    }
 
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}