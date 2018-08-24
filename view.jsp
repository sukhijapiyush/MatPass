<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<html>
<head>
<title>View Record</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
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
<style>
* {
	padding: 2px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
</head>
<body class="container">
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
				String query = "SELECT id,type,purpose,pdesc,bdesc,valid FROM records WHERE id=" + id;
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
	%>

	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
	<h5 align="center"><b><i>VIEW RECORD</i></b></h5>
	<table class="striped centered highlight">
		<tr>
			<td><h6>
					<b>Type: </b>
				</h6></td>
			<td><h6><%=rs.getString("type")%></h6></td>
		</tr>
		<tr>
			<td><h6>
					<b>Purpose</b>
				</h6></td>
			<td><h6><%=rs.getString("purpose")%></h6></td>
		</tr>
		<tr>
			<td><h6>
					<b>Purpose Description</b>
				</h6></td>
			<td><p><%=rs.getString("pdesc")%></p></td>
		</tr>
		<tr>
			<td><h6>
					<b>Bearer Details</b>
				</h6></td>
			<td><p><%=rs.getString("bdesc")%></p></td>
		</tr>
		<tr>
			<td><h6>
					<b>Valid</b>
				</h6></td>
			<td><p><%=rs.getString("valid")%></p></td>
		</tr>
	</table>
	<%
		}

				rs.close();
				con.close();

			} catch (SQLException ex) {
				System.out.println("SQL statement is not executed!");
				ex.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<%
		out.println("<br>");
		out.println("<a href='ListRecords.jsp'> RETURN TO MAIN PAGE </a>");
	%>
</body>
</html>
