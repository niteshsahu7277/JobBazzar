<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<title>Register - Naukari</title>
</head>

<body>
	<%@ include file="header.html"%>
	<span align="left">
		<h1>Registration</h1>
	</span>
	<div class="register_table ">

		<form action="CandidateRegister" method="post">
			<table>
				<tr>
					<td>First Name:</td>
					<td><input class="rcorners" type="text" id="firstName"
						name="firstName" placeholder="First Name" autofocus required
						tabindex="1"></td>
				</tr>

				<tr>
					<td>Last Name:</td>
					<td><input class="rcorners" type="text" id="lastName"
						name="lastName" placeholder="Last Name" required tabindex="2">
					</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input class="rcorners" type="Email" id="email"
						name="email" placeholder="Email" required tabindex="3"></td>
				</tr>

				<tr>
					<td>Mobile:</td>
					<td><input class="rcorners" type="tel" id="tel" name="tel"
						pattern="(7|8|9)\d{9}" placeholder="Mobile Number" required
						tabindex="4"> <!--   <input class="rcorners" type="tel" pattern="(7|8|9)\d{9}" id="tel" name="tel"
                            placeholder="Mobile Number" required tabindex="4"> -->
					</td>
				</tr>

				<tr>
					<td>Password:</td>
					<td><input class="rcorners" type="Password" name="password"
						placeholder="Password" required tabindex="5"></td>
				</tr>


				<tr>
					<td><br>
					<input class="rcorners button" type="submit" id="submit"
						name="submit" value="Register" required tabindex="6"></td>

					<!-- <td>
                        <br><a href="login.html"><input class="rcorners" type="submit" id="submit" name="submit"
                                value="Already Registered?" required tabindex="6"></a>
                    </td> -->
				</tr>

			</table>

		</form>
	</div>
	<%@ include file="footer.html"%>