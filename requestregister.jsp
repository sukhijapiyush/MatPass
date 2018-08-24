<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<html>
<head>
<title>New User Request</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
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
	<div class="" row>
		<h3 class="center">
			<b><i><u>Material Gate Pass System</u></i></b>
		</h3>
	</div>
	<ul>
		<li><a href="LoginPage.jsp">Back</a></li>
	</ul>
	<div class="center"><h4>
		<b><i>New User Registration Form</b></i></h4></div>
	<form action="requestuser" name="form1" method="POST">
		<center>
			<input type="text" id="nam" name="nam"
				placeholder="Firstname Lastname" required></br> <input
				type="password" id="pwd" name="pwd" placeholder="Password" required></br>
			<input type="text" id="sid" name="sid" placeholder="Staff ID"
				required></br> <input type="text" id="eid" name="eid"
				placeholder="Email ID" required></br> <input type="text" id="no"
				name="no" placeholder="Phone Number" required></br> <input
				type="text" id="did" name="did" placeholder="Division ID" required></br>
			<input type="text" id="desg" name="desg" placeholder="Designation"
				required></br> <select name="role"><option
					value="issuer">Issuer</option>
				<option value="authorizer">Authorizer</option>
				<option value="security">Security</option></select>
			<p>
				<label> <input name="role" type="radio" value="issuer"
					checked /> <span>Issuer</span>
				</label> <label> <input name="role" type="radio" value="authorizer" />
					<span>Authorizer</span>
				</label> <label> <input name="role" type="radio" value="security" />
					<span>Security</span>
				</label>
			</p>
			<br> <br> <input type="submit" value="Submit Details">
			<input type="reset" value="Reset Values">
		</center>
	</form>
</body>
</html>
