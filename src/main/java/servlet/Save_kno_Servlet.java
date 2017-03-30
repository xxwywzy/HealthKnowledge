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

@SuppressWarnings("Duplicates")
public class Save_kno_Servlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password;
    private String save_name;
    private String save_dis;
    private String save_link;
    private String save_type;
    private String save_content;
    private String save_kno_tag1;
    private String save_kno_tag2;
    private String save_kno_tag3;
    private String dateTime;
    private String ifPush;
    private int ifReleased;

    protected void processRequest (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =response.getWriter();
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
        user = "sa";
        password = "BiomedIT@ZJU2015";
        save_name = request.getParameter("name_saved");
        byte b_name[] = save_name.getBytes("ISO-8859-1");
        save_name = new String(b_name,"UTF-8");
        System.out.println(save_name);

        save_dis = request.getParameter("dis_saved");
        byte b_dis[] = save_dis.getBytes("ISO-8859-1");
        save_dis = new String(b_dis,"UTF-8");

        save_link = request.getParameter("link_saved");
        byte b_link[] = save_link.getBytes("ISO-8859-1");
        save_link = new String(b_link,"UTF-8");

        save_type = request.getParameter("type_saved");
        byte b_type[] = save_type.getBytes("ISO-8859-1");
        save_type = new String(b_type,"UTF-8");

        save_content= request.getParameter("content_saved");
        byte b_content[] = save_content.getBytes("ISO-8859-1");
        save_content = new String(b_content,"UTF-8");

        save_kno_tag1= request.getParameter("kno_tag1_saved");
        byte b_kno_tag1[] = save_kno_tag1.getBytes("ISO-8859-1");
        save_kno_tag1 = new String(b_kno_tag1,"UTF-8");

        save_kno_tag2= request.getParameter("kno_tag2_saved");
        byte b_kno_tag2[] = save_kno_tag2.getBytes("ISO-8859-1");
        save_kno_tag2 = new String(b_kno_tag2,"UTF-8");

        save_kno_tag3= request.getParameter("kno_tag3_saved");
        byte b_kno_tag3[] = save_kno_tag3.getBytes("ISO-8859-1");
        save_kno_tag3 = new String(b_kno_tag3,"UTF-8");

        ifPush= request.getParameter("ifpush");
        byte bifPush[] = ifPush.getBytes("ISO-8859-1");
        ifPush = new String(bifPush,"UTF-8");

        System.out.println(ifPush);

        Date currDate = Calendar.getInstance().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateTime = sdf.format(currDate);

        if(save_name.isEmpty()){
            out.println("<script language = javascript>alert('知识名称请不要为空');");
            out.println("location.href='index.jsp'</script>");
        }
        else if(save_name.length()>=50){
            out.println("<script language = javascript>alert('知识名称请不要超过50个字');");
            out.println("location.href='index.jsp'</script>");
        }
        else if(save_dis.length()>=150){
            out.println("<script language = javascript>alert('知识描述请不要超过150个字');");
            out.println("location.href='index.jsp'</script>");
        }
        else{
            saveKno();
            //app.main(args);
            out.println("<script language = javascript>alert('保存成功！');");
            out.println("location.href='index.jsp'</script>");
        }

    }

    private void saveKno() throws SQLException{
        Connection conn = DriverManager.getConnection(url, user, password);
        Statement stmt = conn.createStatement();
        if(ifPush.equals("notpush")){
            ifReleased=0;
        }else{
            ifReleased=1;
        }
        String sql_kno = "insert into HealthKno (KnoName, KnoDiscription, KnoElaboration, KnoType, KnoLink, KnoTime, IfReleased) values('"+save_name+"','"+save_dis+"','"+save_content+"','"+save_type+"','"+save_link+"','"+dateTime+"',"+ifReleased+")";
        stmt.executeUpdate(sql_kno);
        //AppPush.AllPush(save_name);
        if(!save_kno_tag1.isEmpty()) {
            Statement stmt_tag_in = conn.createStatement();
            String sql_tag_in = "select * from KnoTag where TagName = '"+save_kno_tag1+"' and TagType = '"+save_type+"'";
            ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
            if(!rs_tag_in.next()){
                String sql_tag = "insert into KnoTag values('"+save_kno_tag1+"','"+save_type+"')";
                stmt.executeUpdate(sql_tag);
            }
            String sql_tag_kno = "insert into KnoTagRelation values('"+save_name+"','"+save_kno_tag1+"','"+save_type+"')";
            stmt.executeUpdate(sql_tag_kno);
            stmt_tag_in.close();
        }
        if(!save_kno_tag2.isEmpty()) {
            Statement stmt_tag_in = conn.createStatement();
            String sql_tag_in = "select * from KnoTag where TagName = '"+save_kno_tag2+"' and TagType = '"+save_type+"'";
            ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
            if(!rs_tag_in.next()){
                String sql_tag = "insert into KnoTag values('"+save_kno_tag2+"','"+save_type+"')";
                stmt.executeUpdate(sql_tag);
            }
            String sql_tag_kno = "insert into KnoTagRelation values('"+save_name+"','"+save_kno_tag2+"','"+save_type+"')";
            stmt.executeUpdate(sql_tag_kno);
            stmt_tag_in.close();
        }
        if(!save_kno_tag3.isEmpty()) {
            Statement stmt_tag_in = conn.createStatement();
            String sql_tag_in = "select * from KnoTag where TagName = '"+save_kno_tag3+"' and TagType = '"+save_type+"'";
            ResultSet rs_tag_in = stmt_tag_in.executeQuery(sql_tag_in);
            if(!rs_tag_in.next()){
                String sql_tag = "insert into KnoTag values('"+save_kno_tag3+"','"+save_type+"')";
                stmt.executeUpdate(sql_tag);
            }
            String sql_tag_kno = "insert into KnoTagRelation values('"+save_name+"','"+save_kno_tag3+"','"+save_type+"')";
            stmt.executeUpdate(sql_tag_kno);
            stmt_tag_in.close();
        }
        stmt.close();
        conn.close();
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