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
							<span class="padding-bottom--15">Sign in to your account</span>
							
							<form:form id="stripe-login" modelAttribute="account" action="login" method="post">
								<div class="field padding-bottom--24">
									<label for="email">Username</label>
									<form:input path="username" />
									<form:errors path="username" cssStyle="color: chocolate"/>
								</div>
								<div class="field padding-bottom--24">
									<div class="grid--50-50">
										<label for="password">Password</label>
										<div class="reset-pass">
											<a href="#">Forgot your password?</a>
										</div>
									</div>
									<form:input path="password" />
									<form:errors path="password" cssStyle="color: chocolate" />
								</div>
								<div class="field field-checkbox padding-bottom--24 flex-flex align-center">
									<label for="checkbox"> 
									<input type="checkbox" class="checkmark" name="remember" value="true"> Remember me ?
									</label>
								</div>
								<div class="field padding-bottom--24">
									<input type="submit" name="submit" value="dang nhap">
								</div>
								<div class="field">
									<a class="ssolink" href="#">Use single sign-on (Google)
										instead</a>
								</div>
							</form:form>
						</div>
					</div>
					<div class="footer-link padding-top--24">
						<span>Don't have an account? <a href="/register">Sign
								up</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>