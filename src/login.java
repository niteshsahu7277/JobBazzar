
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jobbazar.CreateConnection;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pst;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
		try {
			CreateConnection.con=CreateConnection.getMyConnection();
			CallableStatement cst =CreateConnection.con.prepareCall("{ call login(?,?)}");
			String email=request.getParameter("email");
			String pass=request.getParameter("password");
			cst.setString(1, email);
			cst.setString(2, pass);
			ResultSet rs = cst.executeQuery();
			if (rs.next()) {
				 HttpSession session=request.getSession();
				 session.setAttribute("email", rs.getString("emailId").toString());
				System.out.println("Welcome: " + rs.getString("emailId"));
				RequestDispatcher rd=request.getRequestDispatcher("/profile.jsp");
				rd.forward(request, response);
				
			} else {
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Invalid Username or Password');");
				pw.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			}
			CreateConnection.con.close();
		} catch (Exception e) {
			System.out.println("Error: "+e.getMessage());
		}
		//doGet(request, response);
	}

}
