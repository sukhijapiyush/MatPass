<html>
<head>
<title>Successful Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<%
	response.setDateHeader("Expires", 0);
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
	<div>
		<div class="center">
			<h3>
				<b><u><i>Material Gate Pass System</i></u></b>
			</h3>
		</div>
		<div>
			<ul>
				<li><a href="LogoutAction.jsp"
					onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
			</ul>
			<h6>
				<i><b> Welcome User Staff Id:${sessionScope.session_user}</b></i>
			</h6>
			<br>

			<ul class="collection">
				<li><a class="collection-item center" href="ListRecordss.jsp"><b>Approved Records</b></a></li>
				<li><a class="collection-item center" href="ListRecordss2.jsp"><b>Order To Be Returned</b></a></li>
			</ul>
		</div>
	</div>
</body>
</html>
</html>
