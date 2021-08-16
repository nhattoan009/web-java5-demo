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

	<jsp:include page="header.jsp" />

	<form:form class="row g-3 needs-validation" modelAttribute="category" action="/qlcategory"
		style="width: 1000px; margin: 0 auto; padding: 120px;">
		<div class="col-md-4">
			<form:input path="id" class="form-control" placeholder="Mã loại" />
		</div>
		<div class="col-md-4">
			<form:input path="name" class="form-control" placeholder="Tên loại" />
		</div>
		<%-- <div class="col-md-4">
			<form:input path="file" type="file" class="form-control-file" />
		</div> --%>

		<div class="col-12" style="line-height: 60px;">
			<form:button formaction="/create" class="btn btn-primary"
				type="submit">Create</form:button>
		</div>
	</form:form>

	<!-- Table -->
	<table class="table table-sm" style="width: 700px; margin: 0 auto;">
		<thead>
			<tr>
				<th scope="col">Mã loại hàng</th>
				<th scope="col">Tên loại hàng</th>
				<th scope="col">Cập nhật</th>
			</tr>
		</thead>
		<c:set value="1" var="no"/>
		<c:forEach var="i" items="${categorys}">
			<tr>
				<td>${i.id}</td>
				<td>${i.name}</td>
				<td>
					<%-- <a href="/edit/${i.id}">Edit</a> --%>
					<a href="/delete/${i.id}">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>