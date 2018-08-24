<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Material GatePass Login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<div class ="row">
		<h3 class="center header"><u><i><b>Material Gate Pass System</u></i></b></h3>
	</div>
	<div>
		<div>
			<form action="ValidateLogin" method="post">
				<input type="number" class = "active validate" id="sid" name="sid" placeholder="Staff-Id">
				<input type="password" class = "active validate" id="pass" name="pass" placeholder="Password">
				<input type="submit" value="Login">
			</form>
		</div>

		<div>
			<div>
				<ul>
					<li><a href="requestregister.jsp">New User? Request
							Register</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
