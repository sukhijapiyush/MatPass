<html>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<body class="container">
	<ul class="row">
		<li><a href="LogoutAction.jsp"
			onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
	</ul>
	<h6>
		<i><b>Welcome User Staff Id:${sessionScope.session_user}</b></i></h6>
		<div align="center">
			<br>
			<h5><b><i>Account Requests</i></b></h5>
			<table class="striped highlight centered">
				<tbody>
					<td><b>Name</b></td>
					<td><b>Staff-Id</b></td>
					<td><b>Email id</b></td>
					<td><b>Phone Number</b></font></td>
					<td><b>Designation</b></td>
					<td><b>Role</b></td>
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
							rst = stmt.executeQuery("SELECT name,pwd,sid,eid,phno,desig,role FROM newuser");
							while (rst.next()) {
								if (i == (i / 2) * 2) {
					%>
					<tr>
						<td><%=rst.getString(1)%></td>
						<td><%=rst.getString(3)%></td>
						<td><%=rst.getString(4)%></td>
						<td><%=rst.getString(5)%></td>
						<td><%=rst.getString(6)%></td>
						<td><%=rst.getString(7)%></td>
						<td><a
							href="add?sid=<%=rst.getInt("sid")%>&role=<%=rst.getString("role")%>&pwd=<%=rst.getString("pwd")%>">
								Add User </a></td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td><%=rst.getString(1)%></td>
						<td><%=rst.getString(3)%></td>
						<td><%=rst.getString(4)%></td>
						<td><%=rst.getString(5)%></td>
						<td><%=rst.getString(6)%></td>
						<td><%=rst.getString(7)%></td>
						<td><a
							href="add?sid=<%=rst.getInt("sid")%>&role=<%=rst.getString("role")%>&pwd=<%=rst.getString("pwd")%>">
								Add User </a></td>
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
