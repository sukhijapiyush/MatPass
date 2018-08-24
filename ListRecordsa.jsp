<html>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
	<link rel="stylesheet" type="text/css" href="css/main.css">
<body class="container">
	<ul>
		<li><a href="LogoutAction.jsp"
			onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
	</ul>
	<h6>
		<i><b>Welcome User Staff Id:${sessionScope.session_user}</b></i></h6>
		<div align="center">
			<br>
			<h5><b><i>Authorizer Desk</i></b></h5>
			<table class="centered highlight striped">
				<tbody>
					<td><b>ID</b></td>
					<td><b>TYPE</b></td>
					<td><b>PURPOSE</b></td>
					<td><b>PURPOSE DESCRIPTION</b></font></td>
					<td><b>BEARER DETAILS</b></td>
					<td></td>
					<td></td>
					<%
						String DRIVER = "com.mysql.cj.jdbc.Driver";
						Class.forName(DRIVER).newInstance();
						Connection con = null;
						ResultSet rst = null;
						Statement stmt = null;
						try {

							String url = "jdbc:mysql://localhost:3306/matpass?user=root&password=qwerty";
							int i = 1;
							con = DriverManager.getConnection(url);
							stmt = con.createStatement();
							rst = stmt.executeQuery("SELECT id,type,purpose,pdesc,bdesc,valid,auth,ret FROM records");
							while (rst.next()) {
								if (i == (i / 2) * 2) {
					%>
					<tr>
						<td><%=i%></td>
						<td><%=rst.getString(2)%></td>
						<td><%=rst.getString(3)%></td>
						<td><%=rst.getString(4)%></td>
						<td><%=rst.getString(5)%></td>
						<td><a href="viewa.jsp?id=<%=rst.getInt("id")%>"> View
								Record </a></td>

						<%
							if (rst.getInt("auth") == 0) {
						%>
						<td><a href="auth.jsp?id=<%=rst.getInt("id")%>">Authorize</a></td>
						<%
							} else if (rst.getInt("auth") == 1) {
						%>
						<td><a href="unauth.jsp?id=<%=rst.getInt("id")%>">Unauthorize</a></td>
						<%
							}
						%>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td><%=i%></td>
						<td><%=rst.getString(2)%></td>
						<td><%=rst.getString(3)%></td>
						<td><%=rst.getString(4)%></td>
						<td><%=rst.getString(5)%></td>
						<td><a href="viewa.jsp?id=<%=rst.getInt("id")%>"> View
								Record </a></td>
						<%
							if (rst.getInt("auth") == 0) {
						%>
						<td><a href="auth.jsp?id=<%=rst.getInt("id")%>">Authorize</a></td>
						<%
							} else if (rst.getInt("auth") == 1) {
						%>
						<td><a href="unauth.jsp?id=<%=rst.getInt("id")%>">Unauthorize</a></td>
						<%
							}
						%>
					</tr>
					<%
						}

								i++;
							}
							rst.close();
							stmt.close();
							con.close();
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					%>
				</tbody>
			</table>
		</div>
</body>
</html>
