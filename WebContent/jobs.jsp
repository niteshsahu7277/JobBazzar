<%@page import="com.sun.org.apache.regexp.internal.RE"%>
<%@page import="java.sql.*"%>
<%@page import="jobbazar.CreateConnection"%>
<%@page import="static jobbazar.CreateConnection.con"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>

<%@ include file="header.jsp"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");//Proxies
	if (session.getAttribute("email") == null) {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	} else {

		try {
			con = CreateConnection.getMyConnection();
			String sql = "select * from job";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			int i = 1;
%>
<br />
<table border="1">
	<tr style="color: blue;">
		<th>Serial No.</th>
		<th>Job Title</th>
		<th>Salary</th>
		<th>Job Type</th>
	</tr>
	<%
		while (rs.next()) {
	%>
	<tr>
		<td><%=i%></td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getInt("salary")%></td>
		<td><%=rs.getString("type")%></td>
	</tr>
	<%
		i++;
				}
	%>
</table>
<%
	} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
%>
<%@ include file="footer.html"%>
