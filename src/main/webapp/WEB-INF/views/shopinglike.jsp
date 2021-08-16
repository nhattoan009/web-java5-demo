<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<!DOCTYPE html>
<html lang="zxx">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap"
	rel="stylesheet">

<!-- Css Styles -->
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
	<!-- header -->
	<jsp:include page="header.jsp" />
	<!-- nav -->
	<jsp:include page="nav.jsp" />

	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="index.html">TRANG CHU</a> <span>YEU THICH</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="shoping-cart spad">
		<div class="container">

			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">san pham</th>
									<th>gia</th>
									<th></th>
								</tr>
							</thead>

							<c:forEach var="i" items="${like }">
								<input name="id"  type="hidden"
										value="${i.id }">
									<tr>
										<td class="shoping__cart__item"><img
											src="img/cart/cart-1.jpg" alt="">
											<h5>${i.name }</h5></td>
										<c:choose>
											<c:when test="${i.discount > 0 }">
												<td class="shoping__cart__price">
													<div
														class="product__item__price product__discount__item__text">
														${i.price - (i.price * i.discount / 100) } <span>${i.price }</span>
													</div>
												</td>
											</c:when>
											<c:otherwise>
												<td class="shoping__cart__price">${i.price }</td>
											</c:otherwise>
										</c:choose>

										<td><a href="/addCart/${i.id }"
											class="primary-btn cart-btn cart-btn-right"> <span
												class="icon"></span> mua hàng
										</a></td>

										<td class="shoping__cart__item__close"><span class="icon">
												<a class="primary-btn cart-btn cart-btn-right"
												href="/deleteLike/${i.id }">X</a>
										</span></td>
									</tr>
								
							</c:forEach>
						</table>
					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="index" class="primary-btn cart-btn">tiếp tục mua sắm</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
	<jsp:include page="footer.jsp" />

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