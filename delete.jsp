<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
* {
	padding: 2px;
}
</style>
<%
	response.setHeader("Cache-Control", "no-cache"); //forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

	String username = (String) session.getAttribute("session_user");
	if (null == username) {
		request.setAttribute("Error", "Session has ended.  Please login.");
		RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
		rd.forward(request, response);
	}
%>

<%
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/";
	String db = "matpass";
	String driver = "com.mysql.cj.jdbc.Driver";
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url + db, "root", "qwerty");
		try {
			Statement st = con.createStatement();
			String name = request.getParameter("name");
			int in = st.executeUpdate("DELETE FROM records WHERE id='" + id + "'");
			con.close();
			out.println("<p> The record is successfully deleted. </p>");
			out.println("<br>");
			out.println("<a href='ListRecords.jsp'> RETURN TO MAIN PAGE </a>");
		} catch (SQLException ex) {
			System.out.println("SQL statement is not executed!");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
