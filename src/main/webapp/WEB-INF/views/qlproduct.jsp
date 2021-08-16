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

	<form:form modelAttribute="product"	action="/createproduct" method="POST" class="row g-3" style="width: 1000px; margin: 0 auto; padding: 120px;">

			<div class="col-md-4">
				<label for="validationDefault01" class="form-label">Tên sản
					phẩm</label> <form:input path="name" class="form-control" />
			</div>
			<div class="col-md-4">
				<label class="form-label">Giá bán</label>
				<form:input path="price" class="form-control"/>
			</div>
			<div class="col-md-4">
				<label class="form-label">Giảm
					giá</label>
				<div class="input-group">
					<span class="input-group-text">%</span>
					<form:input path="discount" class="form-control"
						aria-describedby="inputGroupPrepend2" value="0"/>
				</div>
			</div>
			<div class="col-md-6">
				<label class="form-label">Ghi chú</label>
				<form:input path="description" class="form-control" />
			</div>
			<div class="col-md-3">
				<label class="form-label">Phân loại</label>
				<form:select class="form-control" path="category.id" items="${category}" itemLabel="name" itemValue="id"/>

			</div>
			<!-- <div class="col-md-3">
				<label class="form-label"> thêm	ảnh</label>
				<input type="file" class="filestyle" name="image" />
			</div> -->
			<div class="col-12">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="invalidCheck2"> <label class="form-check-label"
						for="invalidCheck2"> Available ? </label>
				</div>
			</div>
			<div class="col-12">
				<button class="btn btn-primary" type="submit">Create</button>
			</div>
	</form:form>


	<table class="table table-sm" style="width: 700px; margin: 0 auto;">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Giá bán</th>
				<th scope="col">Mã Loại</th>
				<th scope="col">Ngày tạo</th>
				<th scope="col">img</th>
				<th scope="col">giảm giá</th>
				<th scope="col">Cập nhật</th>
			</tr>
		</thead>
		<c:set value="1" var="no" />
		<c:forEach var="i" items="${products}">
			<tr>
				<td>${i.id}</td>
				<td>${i.name}</td>
				<td>${i.price}</td>
				<td>${i.category.id}</td>
				<td>${i.createdate}</td>
				<td>${i.image}</td>
				<td>${i.discount}</td>
				<td>
				<%-- <a href="/editProduct/${i.id}">Edit</a>  --%>
				<a href="/deleteProduct/${i.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>