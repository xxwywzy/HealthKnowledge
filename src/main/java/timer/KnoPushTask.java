package timer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimerTask;
import send.AppPush;

/**
 * Created by wangzheyu on 2017/3/28.
 */
public class KnoPushTask extends TimerTask{
    private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public void run() {
        try {
            //在这里写你要执行的内容
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
            String user = "sa";
            String password = "BiomedIT@ZJU2015";
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            String sql_kno = "select KnoName from Health_Knowledge where KnoID = 1";
            System.out.print("llllll");
            ResultSet rs = stmt.executeQuery(sql_kno);//创建数据对象
            System.out.print(rs + "\t");
            while (rs.next()){
                System.out.print(rs.getString("KnoName") + "\t");
                AppPush.SinglePush("3654e5648a88454027901ed4cf44ed58",rs.getString("KnoName"));
            }
            rs.close();
            stmt.close();
            conn.close();
            //AppPush.SinglePush("3654e5648a88454027901ed4cf44ed58",rs.getString(1));
            System.out.println("执行当前时间"+formatter.format(Calendar.getInstance().getTime()));
        } catch (Exception e) {
            System.out.println("-------------解析信息发生异常--------------");
        }
    }
}
