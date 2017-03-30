package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;

import send.AppPush;


public class Push_kno_Servlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter(); 
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		AppPush app = new AppPush();
		/*String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Kno";
		String user = "sa";
		String password = "sa";*/
		String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
		String user = "sa";
		String password = "BiomedIT@ZJU2015";
		String save_name = request.getParameter("name_saved");
		byte b_name[] = save_name.getBytes("ISO-8859-1");
		save_name = new String(b_name,"UTF-8");
		System.out.println(save_name);
		
		/*List<String> cid_list = AppPush.getUsercids();
		AppPush.SinglePush(cid_list.get(0), save_name);*/
		
		String tag1 = request.getParameter("tag1_saved");
		byte b_tag1[] = tag1.getBytes("ISO-8859-1");
		tag1 = new String(b_tag1,"UTF-8");
		System.out.println(tag1);
		
		String tag2 = request.getParameter("tag2_saved");
		byte b_tag2[] = tag2.getBytes("ISO-8859-1");
		tag2 = new String(b_tag2,"UTF-8");
		System.out.println(tag2);
		
		String tag3 = request.getParameter("tag3_saved");
		byte b_tag3[] = tag3.getBytes("ISO-8859-1");
		tag3 = new String(b_tag3,"UTF-8");
		System.out.println(tag3);
		
		String tag4 = request.getParameter("tag4_saved");
		byte b_tag4[] = tag4.getBytes("ISO-8859-1");
		tag4 = new String(b_tag4,"UTF-8");
		System.out.println(tag4);
		
		if(save_name.isEmpty()){
			out.println("<script language = javascript>alert('请选择知识');");
			out.println("location.href='index.jsp'</script>");
		}
		else{
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			List<String> cid_list = AppPush.getUsercids();
			List<String> tag_selected_list = new ArrayList<String>();
			if(!tag1.isEmpty()) tag_selected_list.add(tag1);
			if(!tag2.isEmpty()) tag_selected_list.add(tag2);
			if(!tag3.isEmpty()) tag_selected_list.add(tag3);
			if(!tag4.isEmpty()) tag_selected_list.add(tag4);
			String sql_recommend_kno = "insert into Recommend_kno values('"+save_name+"','"+tag1+"','"+tag2+"','"+tag3+"','"+tag4+"')";
			stmt.executeUpdate(sql_recommend_kno); 
			//List<String> cid_send_list = new ArrayList<String>();
			int size = cid_list.size();
				for(int i=0;i<size;i++){
					String tags = AppPush.getUserTags(cid_list.get(i));
					int tag_size = tag_selected_list.size();
					int hastag = 0;
					for(int k=0;k<tag_size;k++){
						if(tags.contains(tag_selected_list.get(k))){
							hastag++;
						}else break;
					}
					if(hastag==tag_size&&hastag!=0){
						AppPush.SinglePush(cid_list.get(i), save_name);
						String alias = AppPush.getUserAlias(cid_list.get(i));
						System.out.println(alias);
					}
				}
			stmt.close();
			conn.close();
		    //app.main(args);
			out.println("<script language = javascript>alert('保存成功！');");
			out.println("location.href='index.jsp'</script>");
		}
		
	}
	/**
	 * Constructor of the object.
	 */
	public Push_kno_Servlet() {
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
