<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<!-- from -->
	<jsp:include page="header.jsp" />
	
	<form:form class="row g-3" modelAttribute="account" method="post"
		action="/createAccount"
		style="width: 1000px; margin: 0 auto; padding: 120px;">
		<div class="col-md-4">
			<label class="form-label">Username</label>
			<form:input path="username" class="form-control"
				/>
		</div>
		<div class="col-md-4">
			<label class="form-label">Fullname</label>
			<form:input path="fullname" class="form-control" />
		</div>
		<div class="col-md-4">
			<label class="form-label">Password</label>
			<form:input type="password" path="password" class="form-control" />
		</div>
		<div class="col-md-6">
			<label class="form-label">Email</label>
			<form:input path="email" value=" @gmail.com" class="form-control" />
		</div>

		<div class="col-12">
			<%-- <div class="form-check">
			<label	class="form-check-label">
				<form:checkbox class="form-check-input" value="" path="activated" />
				 Activated ? </label>
			</div> --%>
			
			
			<div class="form-check">
			<label	class="form-check-label">
				<form:checkbox class="form-check-input" value=""  path="admin" />
				 Admin ? </label>
			</div>
		
		</div>
		
		
		
		<div class="col-12">
			<button formaction="/createAccount" class="btn btn-primary"
				type="submit">Create</button>
		</div>
		
	</form:form>

	<!-- Table -->
	<table class="table table-sm" style="width: 1000px; margin: 0 auto;">
		<thead>
			<tr>
				<th scope="col">Username</th>
				<th scope="col">Fullname</th>
				<th scope="col">Password</th>
				<th scope="col">Email</th>
				<th scope="col">Admin</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${accounts }">
				<tr>
					<th>${i.username }</th>
					<td>${i.fullname }</td>
					<td>${i.password }</td>
					<td>${i.email }</td>
					<td>${i.admin }</td>
					<%-- <td>${i.admin?'Admin' : 'User'}</td> --%>
					<td>
						<%-- <a href="/editAccount/${i.username}">Edit</a> --%>
						<a href="/deleteAccount/${i.username}">Delete</a>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
</body>
</html>