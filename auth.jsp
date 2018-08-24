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
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/";
	;
	String db = "matpass";
	String driver = "com.mysql.cj.jdbc.Driver";
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url + db, "root", "qwerty");
		try {
			Statement st = con.createStatement();
			int in = st.executeUpdate("UPDATE records SET auth= " + 1 + " WHERE id=" + id);
			con.close();
			out.println("<p> The record is successfully authorized. </p>");
			out.println("<br>");
			out.println("<a href='ListRecordsa.jsp'> RETURN TO MAIN PAGE </a>");
		} catch (SQLException ex) {
			System.out.println("SQL statement is not executed!");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

