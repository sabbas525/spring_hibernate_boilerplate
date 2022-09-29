<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Database Query Result</title>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

.button1 {
	background-color: #008CBA; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

.button2:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

* {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
}

body {
	background-color: #fff;
	font-family: Montserrat;
	overflow-x: hidden;
}

article, aside, details, figure, footer, header, main, menu, nav,
	section, summary {
	display: block;
}

h1, h2, h3, h4, h5, h6, p, a {
	-ms-word-wrap: break-word;
	word-wrap: break-word;
	text-decoration: none;
}

img {
	border: none;
}

*:focus {
	outline: none;
}

.clearfix::after {
	content: "";
	display: table;
	clear: both;
}

.bg-illustration {
	position: relative;
	height: 100vh;
	width: 1194px;
	background: url("https://i.ibb.co/RhMZprS/jony-Image2-1.png") no-repeat
		center center scroll;
	background-size: cover;
	float: left;
	-webkit-animation: bgslide 2.3s forwards;
	animation: bgslide 2.3s forwards;
}

.bg-illustration img {
	width: 248px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	height: auto;
	margin: 19px 0 0 25px;
}

@
-webkit-keyframes bgslide {from { left:-100%;
	width: 0;
	opacity: 0;
}

to {
	left: 0;
	width: 1194px;
	opacity: 1;
}

}
@
keyframes bgslide {from { left:-100%;
	width: 0;
	opacity: 0;
}

to {
	left: 0;
	width: 1194px;
	opacity: 1;
}

}
.login {
	max-height: 100vh;
	overflow-Y: auto;
	float: left;
	margin: 0 auto;
	width: calc(100% - 1194px);
}

.login .container {
	width: 505px;
	margin: 0 auto;
	position: relative;
}

.login .container h1 {
	margin-top: 100px;
	font-size: 35px;
	font-weight: bolder;
}

.login .container .login-form {
	margin-top: 112px;
}

.login .container .login-form form {
	display: -ms-grid;
	display: grid;
}

.login .container .login-form form input {
	font-size: 16px;
	font-weight: normal;
	background: rgba(57, 57, 57, 0.07);
	margin: 12.5px 0;
	height: 68px;
	border: none;
	padding: 0 30px;
	border-radius: 10px;
}

.login .container .login-form form button[type=submit] {
	background: -webkit-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: -o-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);
	border: none;
	margin-top: 124px;
	margin-bottom: 20px;
	width: 241px;
	height: 58px;
	text-transform: uppercase;
	color: white;
	border-radius: 10px;
	position: relative;
	z-index: 2;
	font-weight: bold;
	font-size: 20px;
}

.login .container .login-form form button[type=submit]:hover::after {
	opacity: 1;
}

.login .container .login-form form button[type=submit]::after {
	content: "";
	position: absolute;
	z-index: -1;
	border-radius: 10px;
	opacity: 0;
	top: 0;
	left: 0;
	-webkit-transition: 0.3s ease-in-out;
	-o-transition: 0.3s ease-in-out;
	transition: 0.3s ease-in-out;
	right: 0;
	bottom: 0;
	background: -webkit-gradient(linear, left bottom, left top, from(#09203f),
		to(#537895));
	background: -webkit-linear-gradient(bottom, #09203f 0%, #537895 100%);
	background: -o-linear-gradient(bottom, #09203f 0%, #537895 100%);
	background: linear-gradient(to top, #09203f 0%, #537895 100%);
}

.login .container .remember-form {
	position: relative;
	margin-top: -30px;
}

.login .container .remember-form input[type=checkbox] {
	margin-top: 9px;
}

.login .container .remember-form span {
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	top: 32px;
	color: #3B3B3B;
	margin-left: 15px;
}

.login .container .forget-pass {
	position: absolute;
	right: 0;
	margin-top: 189px;
}

.login .container .forget-pass a {
	font-size: 16px;
	position: relative;
	font-weight: normal;
	color: #918F8F;
}

.login .container .forget-pass a::after {
	content: "";
	position: absolute;
	height: 2px;
	width: 100%;
	border-radius: 100px;
	background: -webkit-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: -o-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);
	bottom: -4px;
	left: 0;
	-webkit-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
	right: 0;
}

.login .container .forget-pass a:hover::after {
	opacity: 1;
}

@media only screen and (min-width: 1024px) and (max-width: 1680px) {
	.bg-illustration {
		width: 50%;
		-webkit-animation: none;
		animation: none;
	}
	.login {
		width: 50%;
	}
}
/* Display 12", iPad PRO Portrait, iPad landscape */
@media only screen and (max-width: 1024px) {
	body {
		overflow-x: hidden;
	}
	@
	-webkit-keyframes slideIn {from { left:-100%;
		opacity: 0;
	}
	to {
		left: 0;
		opacity: 1;
	}
}

@
keyframes slideIn {from { left:-100%;
	opacity: 0;
}

to {
	left: 0;
	opacity: 1;
}

}
.bg-illustration {
	float: none;
	background: url("https://i.ibb.co/rwncw7s/bg-mobile.png") center center;
	background-size: cover;
	-webkit-animation: slideIn 0.8s ease-in-out forwards;
	animation: slideIn 0.8s ease-in-out forwards;
	width: 100%;
	height: 190px;
	text-align: center;
}

.bg-illustration img {
	width: 100px;
	height: auto;
	margin: 20px auto !important;
	text-align: center;
}

.bg-illustration .burger-btn {
	left: 33px;
	top: 29px;
	display: block;
	position: absolute;
}

.bg-illustration .burger-btn span {
	display: block;
	height: 4px;
	margin: 6px;
	background-color: #fff;
}

.bg-illustration .burger-btn span:nth-child(1) {
	width: 37px;
}

.bg-illustration .burger-btn span:nth-child(2) {
	width: 28px;
}

.bg-illustration .burger-btn span:nth-child(3) {
	width: 20px;
}

.login {
	float: none;
	margin: 0 auto;
	width: 100%;
}

.login .container {
	-webkit-animation: slideIn 0.8s ease-in-out forwards;
	animation: slideIn 0.8s ease-in-out forwards;
	width: 85%;
	float: none;
}

.login .container h1 {
	font-size: 25px;
	margin-top: 40px;
}

.login .container .login-form {
	margin-top: 90px;
}

.login .container .login-form form input {
	height: 45px;
}

.login .container .login-form form button[type=submit] {
	height: 45px;
	margin-top: 100px;
}

.login .container .login-form .remember-form {
	position: relative;
	margin-top: -14px;
}

.login .container .login-form .remember-form span {
	font-size: 16px;
	margin-top: 22px;
	top: inherit;
}

.forget-pass {
	position: absolute;
	right: inherit;
	left: 0;
	bottom: -40px;
	margin: 0 !important;
}

.forget-pass a {
	font-size: 16px;
	position: relative;
	font-weight: normal;
	color: #918F8F;
}

.forget-pass a::after {
	content: "";
	position: absolute;
	height: 2px;
	width: 100%;
	border-radius: 100px;
	background: -webkit-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: -o-linear-gradient(110deg, #f794a4 0%, #fdd6bd 100%);
	background: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);
	bottom: -4px;
	left: 0;
	-webkit-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
	opacity: 0;
	right: 0;
}

.forget-pass a:hover::after {
	opacity: 1;
}

}
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

/* Add some padding inside the card container */
.container {
	padding: 2px 16px;
}
</style>
</head>
<body>

	<div class="parent clearfix">
		<div class="bg-illustration">

			<div class="burger-btn">
				<span></span> <span></span> <span></span>
			</div>

		</div>

		<div class="login" style="text-align: center;">
			<div class="container">
				<div class="login-form card">

					<h1>The Result of your query from the Repository</h1>

					<br>
					<h4 style="text-align: center;">
						<input class="button button2" type="button" onclick="shows()"
							value="SHOW ANSWERS">
					</h4>

					<br>
					<div class="btn-group" style="text-align: center;">
						<c:choose>
							<c:when test="${list==null}">
								<h2>${message}</h2>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="u">

									<h2 style="text-align: center;">
										<font color="purple">Question :</font><br>
										<c:out value="${u.question}" />
										<br> <br> <font color="purple">Enter answer </font><input
											type=text>
									</h2>
									<p style="visibility: hidden; text-align: center;">
										<font color="blue">Correct Answer :</font>
										<c:out value="${u.answer}" />
									</p>

									<h2 style="text-align: center;">
										<font color="purple">Knowledge : </font>
										<c:out value="${u.knowledgeareas}" />
									</h2>

									<hr style="width: 50%">
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<h4 style="text-align: center;">
							<a href="/QuestionAnswerwebapp/"><button
									class="button1 button2" type="button">Return to main
									page</button></a>
						</h4>
					</div>


				</div>
			</div>
		</div>
	</div>


	<script>
		function shows() {
			let l = document.getElementsByTagName("p");
			for (let i = 0; i < l.length; i++) {
				l[i].style.visibility = "visible";
			}
		}
	</script>
</body>
</html>