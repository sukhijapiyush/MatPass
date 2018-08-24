<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<html>
<head>
<title>Update Record</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
	<form method="POST" action="update">
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		<h2 align="center">UPDATE RECORD</h2>
		<table>
			<tr>
				<td><b>Type</b></td>
				<td><label><input name="type" type="radio"
						value="returnable" checked /> <span>Returnable</span></label> <label><input
						name="type" type="radio" value="non-returnable" /> <span>Non-Returnable</span></td>
				</label>
				</td>
			</tr>
			<tr>
				<td><b>Purpose</b></td>
				<td><input type="text" name="purpose"
					value="<%=rs.getString("purpose")%>" /></td>
			</tr>
			<tr>
				<td><b>Purpose Description</b></td>
				<td><textarea class="materialize-textarea" name="pdesc"><%=rs.getString("pdesc")%></textarea></td>
			</tr>
			<tr>
				<td><b>Bearer Details</b></td>
				<td><textarea class="materialize-textarea" name="bdesc"><%=rs.getString("bdesc")%></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" name="submit"></td>
				<td><input type="reset" value="Reset" name="reset"></td>

			</tr>
		</table>
	</form>


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
