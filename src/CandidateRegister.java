

import java.io.IOException;

import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jobbazar.CreateConnection;

import static jobbazar.CreateConnection.con;
/**
 * Servlet implementation class CandidateRegister
 */
@WebServlet("/CandidateRegister")
public class CandidateRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement pst;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandidateRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			con = CreateConnection.getMyConnection();
			 int id=1;
			pst = con.prepareCall("{CALL  register(?,?,?,?,?,?)}");
			pst.setString(1, request.getParameter("email"));
			pst.setString(2, request.getParameter("password"));
			pst.setString(3, request.getParameter("name"));
			pst.setString(4,request.getParameter("phone"));
			pst.setString(5, "Job Seeker");
			pst.setInt(6,id++);
			int row = pst.executeUpdate();
			if (row != -1)
				System.out.println("Registered"+"\n No. Of Rows Affected: "+row);
			else
				System.out.println("Failed");
			CreateConnection.con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		doGet(request, response);
	}

}
