<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="login-root">
		<div class="box-root flex-flex flex-direction--column"
			style="min-height: 100vh; flex-grow: 1;">
			<div
				class="box-root padding-top--24 flex-flex flex-direction--column"
				style="flex-grow: 1; z-index: 9;">
				<div
					class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
					<h1>
						<a href="index"><img src="img/logo.png" alt=""></a>
					</h1>

				</div>
				<div class="formbg-outer">
					<div class="formbg">
						<div class="formbg-inner padding-horizontal--48">
							<span class="padding-bottom--15">Sign up</span>
							<form:form id="stripe-login" modelAttribute="register" action="/register" method="post">
								<div class="field padding-bottom--24">
									<label>Username</label> <input type="text" name="username">
								</div>
								<div class="field padding-bottom--24">
									<label>Fullname</label> <input type="text" name="fullname">
								</div>
								<div class="field padding-bottom--24">
									<label>Email</label> <input type="email" name="email">
								</div>
								<div class="field padding-bottom--24">
									<label>Password</label> <input type="password" name="password">
								</div>

								<div class="field padding-bottom--24">
									<input type="submit" name="submit" value="Continue">
								</div>
								<div class="field">
									<a class="ssolink" href="/login">Sign in to your account</a>
								</div>
							</form:form>
						</div>
					</div>
					<div class="footer-link padding-top--24"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>