package servlet;

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

import send.AppPush;


public class Save_kno_Servlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter(); 
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//AppPush app = new AppPush();
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
		
		String save_dis = request.getParameter("dis_saved");
		byte b_dis[] = save_dis.getBytes("ISO-8859-1");
		save_dis = new String(b_dis,"UTF-8");
		
		String save_link = request.getParameter("link_saved");
		byte b_link[] = save_link.getBytes("ISO-8859-1");
		save_link = new String(b_link,"UTF-8");
		
		String save_type = request.getParameter("type_saved");
		byte b_type[] = save_type.getBytes("ISO-8859-1");
		save_type = new String(b_type,"UTF-8");
		
		
		String save_content= request.getParameter("content_saved");
		byte b_content[] = save_content.getBytes("ISO-8859-1");
		save_content = new String(b_content,"UTF-8");
		
		String save_kno_tag1= request.getParameter("kno_tag1_saved");
		byte b_kno_tag1[] = save_kno_tag1.getBytes("ISO-8859-1");
		save_kno_tag1 = new String(b_kno_tag1,"UTF-8");
		
		String save_kno_tag2= request.getParameter("kno_tag2_saved");
		byte b_kno_tag2[] = save_kno_tag2.getBytes("ISO-8859-1");
		save_kno_tag2 = new String(b_kno_tag2,"UTF-8");
		
		String save_kno_tag3= request.getParameter("kno_tag3_saved");
		byte b_kno_tag3[] = save_kno_tag3.getBytes("ISO-8859-1");
		save_kno_tag3 = new String(b_kno_tag3,"UTF-8");
		
		String selected_user = request.getParameter("user");
		byte b_user[] = selected_user.getBytes("ISO-8859-1");
		selected_user = new String(b_user,"UTF-8");
		System.out.println(selected_user);
		
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
		
		Date currDate = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTime = sdf.format(currDate);
		
		if(save_name.isEmpty()){
			out.println("<script language = javascript>alert('知识名称请不要为空');");
			out.println("location.href='index.jsp'</script>");
		}
		else if(save_name.length()>=16){
			out.println("<script language = javascript>alert('知识名称请不要超过16个字');");
			out.println("location.href='index.jsp'</script>");
		}
		else if(save_dis.length()>=50){
			out.println("<script language = javascript>alert('知识描述请不要超过50个字');");
			out.println("location.href='index.jsp'</script>");
		}
		else{
			/*Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			String sql_kno = "insert into Health_Knowledge values('"+save_name+"','"+save_dis+"','"+save_content+"','"+save_type+"','"+save_link+"','"+dateTime+"')";
			stmt.executeUpdate(sql_kno);*/
			String cid = "ededbbaaa86c66b91da6fd8b64e3148d";
			AppPush.SinglePushForIos(cid,save_name);
//			if(!save_kno_tag1.isEmpty()) {
//				Statement stmt_tag_in = conn.createStatement();
//				String sql_tag_in = "select * from Knowledge_Tag where TagName = '"+save_kno_tag1+"' and TagType = '"+save_type+"'";
//			    ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
//			    if(!rs_tag_in.next()){
//			    	String sql_tag = "insert into Knowledge_Tag values('"+save_kno_tag1+"','"+save_type+"')";
//					stmt.executeUpdate(sql_tag);
//			    }
//				String sql_tag_kno = "insert into Tag_AND_Knowledge values('"+save_name+"','"+save_kno_tag1+"','"+save_type+"')";
//				stmt.executeUpdate(sql_tag_kno);
//				stmt_tag_in.close();
//			}
//			if(!save_kno_tag2.isEmpty()) {
//				Statement stmt_tag_in = conn.createStatement();
//				String sql_tag_in = "select * from Knowledge_Tag where TagName = '"+save_kno_tag2+"' and TagType = '"+save_type+"'";
//			    ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
//			    if(!rs_tag_in.next()){
//				String sql_tag = "insert into Knowledge_Tag values('"+save_kno_tag2+"','"+save_type+"')";
//				stmt.executeUpdate(sql_tag);
//			    }
//				String sql_tag_kno = "insert into Tag_AND_Knowledge values('"+save_name+"','"+save_kno_tag2+"','"+save_type+"')";
//				stmt.executeUpdate(sql_tag_kno);
//				stmt_tag_in.close();
//			}
//			if(!save_kno_tag3.isEmpty()) {
//				Statement stmt_tag_in = conn.createStatement();
//				String sql_tag_in = "select * from Knowledge_Tag where TagName = '"+save_kno_tag3+"' and TagType = '"+save_type+"'";
//			    ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
//			    if(!rs_tag_in.next()){
//				String sql_tag = "insert into Knowledge_Tag values('"+save_kno_tag3+"','"+save_type+"')";
//				stmt.executeUpdate(sql_tag);
//			    }
//				String sql_tag_kno = "insert into Tag_AND_Knowledge values('"+save_name+"','"+save_kno_tag3+"','"+save_type+"')";
//				stmt.executeUpdate(sql_tag_kno);
//				stmt_tag_in.close();
//			}
			//stmt.close();
			//conn.close();
		    //app.main(args);
			out.println("<script language = javascript>alert('保存成功！');");
			out.println("location.href='index.jsp'</script>");
		}
		
	}
	/**
	 * Constructor of the object.
	 */
	public Save_kno_Servlet() {
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
