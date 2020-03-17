package jobbazar;

import java.sql.Connection;
import java.sql.DriverManager;

public class CreateConnection {

public static Connection con=null;
	
	public static Connection getMyConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/jobportal";
			con=DriverManager.getConnection(url,"root","system");
			
		
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("Connection Established");
		return con;
		

	}
}
