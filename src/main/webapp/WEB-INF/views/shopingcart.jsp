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
							<a href="index.html">TRANG CHU</a> <span>GIO HANG</span>
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
									<th>so luong</th>
									<th>tong tien</th>
									<th></th>
								</tr>
							</thead>


							<c:forEach var="i" items="${cart }">
								<form action="/update" method="POST">
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

										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" name="qty" value="${i.quantity }"
														onblur="this.form.submit()" />
														
												</div>
											</div>
										</td>

										<c:choose>
											<c:when test="${i.discount > 0 }">
												<td class="shoping__cart__total">${i.quantity * i.price - (i.price * i.discount / 100) }</td>

											</c:when>
											<c:otherwise>
												<td class="shoping__cart__total">${i.quantity * i.price }</td>
											</c:otherwise>
										</c:choose>


										<td class="shoping__cart__item__close"><span class="icon">
												<a class="primary-btn cart-btn cart-btn-right"
												href="/delete/${i.id }">X</a>



										</span></td>
									</tr>
								</form>
							</c:forEach>
						</table>
						<c:if test="${total>0 }">
							<br>
							<a href="/deleteAll" class="primary-btn cart-btn cart-btn-right">
								<span class="icon"></span> xóa tất cả
							</a>
							<br>
						</c:if>

					</div>

				</div>
			</div>




			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="index" class="primary-btn cart-btn">tiếp tục mua sắm</a>
						<a href="shopingcart" class="primary-btn cart-btn cart-btn-right"><span
							class="icon_loading"></span> cập nhật giỏ hàng</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__continue">
						<div class="shoping__discount">
							<h5>Discount Codes</h5>
							<form action="#">
								<input type="text" placeholder="mã giảm giá của ban">
								<button type="submit" class="site-btn">áp dụng</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__checkout">

					<%-- 	<c:forEach var="i" items="${cart }">
							<c:choose>
								<c:when test="${i.discount > 0 }">
									<ul>
										<li>tạm tính<span>${totaldiscount }</span></li>
										<li>tổng tiền<span>${totaldiscount }</span></li>
									</ul>
								</c:when>
								<c:otherwise> --%>
									<ul>
										<li>tạm tính<span>${total }</span></li>
										<li>tổng tiền<span>${total }</span></li>
									</ul>
								<%-- </c:otherwise>
							</c:choose>
						</c:forEach> --%>



						<a href="checkout" class="primary-btn">tiếp theo</a>


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