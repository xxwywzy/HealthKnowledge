package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class Upload extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		//sfu.setFileSizeMax(2048*800);
		PrintWriter out =response.getWriter(); 
		try{
			@SuppressWarnings("unchecked")
			List<FileItem> items = sfu.parseRequest(request);
			for(int i=0;i<items.size();i++){
				FileItem item = items.get(i);
				if(!item.isFormField()){
					ServletContext sctx = getServletContext();
					String path = sctx.getRealPath("/upload");
					String real_path = "http://120.27.141.50:8080/health-knowledge/upload";
					System.out.println(path);
					String fileName = item.getName();
					System.out.println(fileName);
					fileName = fileName.substring(fileName.lastIndexOf("/")+1);
					String fulllink = path+"\\"+fileName;
					String reallink = real_path+"/"+fileName;
					System.out.println(fulllink);
					File file = new File(fulllink);
					if(!file.exists()){
						item.write(file);
						//out.println("<script language = javascript>alert('上传成功！');");
						request.getSession().setAttribute("pic_link", reallink);
						response.sendRedirect("index.jsp");
						return;
						//out.println("location.href='index.jsp'</script>");
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
/*		PrintWriter out =response.getWriter(); 
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Kno";
		String user = "sa";
		String password = "sa";
		String url = "jdbc:sqlserver://115.28.42.235:1433;DatabaseName=HypertensionTest";
		String user = "sa";
		String password = "Vico0808";*/
		
	}
	/**
	 * Constructor of the object.
	 */
	public Upload() {
		super();
		
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        try {
			processRequest(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
