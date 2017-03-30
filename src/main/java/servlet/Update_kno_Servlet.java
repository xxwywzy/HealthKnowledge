package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Update_kno_Servlet extends HttpServlet {

	protected void processRequest (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		/*String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Kno";
		String user = "sa";
		String password = "sa";*/
		String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
		String user = "sa";
		String password = "BiomedIT@ZJU2015";
		String update_name = request.getParameter("name_updated");
		byte b_name[] = update_name.getBytes("ISO-8859-1");
		update_name = new String(b_name,"UTF-8");
		
		String name_before = request.getParameter("name_before");
		byte b_name_before[] = name_before.getBytes("ISO-8859-1");
		name_before = new String(b_name_before,"UTF-8");

		String update_dis = request.getParameter("dis_updated");
		byte b_dis[] = update_dis.getBytes("ISO-8859-1");
		update_dis = new String(b_dis,"UTF-8");
		
		String update_con = request.getParameter("con_updated");
		byte b_con[] = update_con.getBytes("ISO-8859-1");
		update_con = new String(b_con,"UTF-8");
		
		String update_link = request.getParameter("link_updated");
		byte b_link[] = update_link.getBytes("ISO-8859-1");
		update_link = new String(b_link,"UTF-8");
		
		Date currDate = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTime = sdf.format(currDate);
	
		if(update_name.isEmpty()){
			out.println("<script language = javascript>alert('知识名称请不要为空');");
			out.println("location.href='kno-show.jsp'</script>");
		}
		else if(update_name.length()>=16){
			out.println("<script language = javascript>alert('知识名称请不要超过16个字');");
			out.println("location.href='index.jsp'</script>");
		}
		else if(update_dis.length()>=50){
			out.println("<script language = javascript>alert('知识描述请不要超过50个字');");
			out.println("location.href='kno-show.jsp'</script>");
		}
		else{
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			String sql = "update Health_Knowledge set KnoName='"+update_name+"',KnoDiscription='"+update_dis+"',KnoElaboration='"+update_con+"',KnoLink='"+update_link+"',KnoTime='"+dateTime+"' where  KnoName='"+name_before+"'";
			stmt.executeUpdate(sql);
			String sql_tag = "update Tag_AND_Knowledge set KnoName='"+update_name+"' where KnoName='"+name_before+"'";
			stmt.executeUpdate(sql_tag);
			Statement stmt_kno_in = conn.createStatement();
			String sql_kno_in = "select * from Recommend_kno where KnoName='"+name_before+"'";
		    ResultSet rs_kno_in = stmt_kno_in.executeQuery(sql_kno_in);
		    if(rs_kno_in.next()){
		    	String sql_recommend = "update Recommend_kno set KnoName='"+update_name+"' where KnoName='"+name_before+"'";
				stmt.executeUpdate(sql_recommend);
		    }
		    stmt_kno_in.close();
			stmt.close();
			conn.close();
			out.println("<script language = javascript>alert('更新成功！');");
			out.println("location.href='kno-show.jsp'</script>");
		}
		
	}
	/**
	 * Constructor of the object.
	 */
	public Update_kno_Servlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
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
