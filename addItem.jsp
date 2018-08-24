<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script>
	function showme() {
		var s = document.form1.type;
		var h = document.form1.valid;
		if (s.selectedIndex == 1) {
			h.style.visibility = "visible";
		} else {
			h.style.visibility = "hidden";
		}
	}
</script>
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

<html>
<style>
* {
	padding: 2px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<script>
	$(document).ready(function() {
		document.getElementsByTagName('select').material_select();
	});
</script>
<body class="container">
	<title>Register Item</title>
	<div class="center">
		<h3>
			<b><u><i>Material Gate Pass System</i></u></b>
		</h3>
	</div>
	<ul>
		<li><a href="LogoutAction.jsp"
			onclick="return confirm('Are you sure you want to Logout?')">Logout</a></li>
	</ul>
	<div class="center">
		<h5>
			<b><i>ADD ITEM</i></b>
		</h5>
	</div>
	<form action="register" name="form1" method="POST">
		<p>
      <label>
        <input name="type" type="radio" value="Returnable" checked />
        <span>Returnable</span>
      </label>
      <label>
        <input name="type" type="radio" value="Non-Returnable"/>
        <span>Non-Returnable</span>
      </label>
    </p>
		<input type="text" id="pur" name="pur"
			placeholder="Enter the purpose..." required></br>
		<textarea class="materialize-textarea" name="pdesc" placeholder="Enter purpose description..."
			required></textarea>
		<textarea class="materialize-textarea" name="bdesc" placeholder="Enter bearer details..." required></textarea>
		<br /> <input type="submit" value="Register Item"> <input
			type="reset" value="Reset">
	</form>
</body>
</html>
