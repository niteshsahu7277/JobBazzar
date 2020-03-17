<%@page import="java.sql.*"%>
<%@page import="jobbazar.CreateConnection"%>
<%@page import="static jobbazar.CreateConnection.con"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="header.jsp"%>
<%
	
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");
	if (session.getAttribute("email") == null) {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	} else {
		try {
			con = CreateConnection.getMyConnection();
			PreparedStatement pst = con.prepareStatement("select * from users where email =?");
			pst.setString(1, session.getAttribute("email").toString());
			ResultSet rs = pst.executeQuery();
%>
<br />
<table border="1">
	<%
		if (rs.next()) {
	%>
	<tr>
		<th>Name</th>
		<td><%=rs.getString("name")%></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><%=rs.getString("email")%></td>
	</tr>
	<tr>
		<th>Phone</th>
		<td><%=rs.getString("phone")%></td>
	</tr>
	<tr>
		<th>Location</th>
		<td><%=rs.getString("location")%></td>
	</tr>
	<tr>
		<th>Date Of Birth</th>
		<td><%=rs.getString("dob")%></td>
	</tr>

	<%
		}
	%>
</table>
<%
	} catch (Exception e) {
			System.out.println("Profile Error " + e.getMessage());
		}
	}
%>

<%@ include file="footer.html"%>
