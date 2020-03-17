<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/style_index.css">
<link rel="stylesheet" href="CSS/style_register.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat&display=swap"
	rel="stylesheet">
</head>
<body class="bgimage">

	<%
		if (session.getAttribute("email") == null) {
	%>
	<header class="nav">
		<ul>
			<li><img class="logo"
				src="https://upload.wikimedia.org/wikipedia/commons/2/2f/JB_logo_2.png"
				alt="Job Bazzar" /></li>
		</ul>
		<div class=" nav-right">
			<ul>
				<li><a href="#" id="myBtn">Login</a></li>
				<li><a class="active" href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
				<li><a href="#home">Home</a></li>
			</ul>
		</div>
	</header>
	<%
		} else {
	%>
	<header class="nav">
		<ul>
			<li><img class="logo"
				src="https://upload.wikimedia.org/wikipedia/commons/2/2f/JB_logo_2.png"
				alt="Job Bazzar" /></li>
		</ul>
		<div class=" nav-right">
			<ul>
				<li><a href="logout" id="logout">logout</a></li>
				<li><a class="active" href="#about">Applied Job</a></li>
				<li><a href="profile.jsp">Profile</a></li>
				<li><a href="jobs.jsp">Jobs</a></li>
			</ul>
		</div>
	</header>
	<%
		}
	%>
	<div id="login" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div class="container">
				<form action="login" method="post">
					<table>
						<tr>
							<td>Email Address:</td>
							<td><input type="Email" id="email" name="email"
								placeholder="Enter your Email" tabindex="1" required></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="Password" name="password"
								placeholder="Enter your Password" tabindex="2" required>
							</td>
						</tr>
						<tr>
							<td><br> <input type="submit" class="button"
								name="submit" value="Login" required tabindex="3"></td>
							<td><a href="#">Forgot Password</a> <a href="register.jsp">Register</a>
							</td>
						</tr>

					</table>
				</form>

			</div>

		</div>
	</div>

	<script type="text/javascript">
		var modal = document.getElementById("login");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>