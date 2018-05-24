package DBCon;

import static dao.GetQueryInfo.rand;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Random;

public class DbConnection {
public static Connection con = null;
public static Connection getConnection(){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/llts_db", "root", "root");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return con;
}
public static void main(String[] args) {
	System.out.println("Connection is : "+getConnection());
        //System.out.println("Randam Number is : "+new Random().nextInt(165984656));
}
}
