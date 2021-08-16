<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="index.html">trang chu</a> <span>thanh toan</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6>
						<span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
							here</a> to enter your code
					</h6>
				</div>
			</div>
			<div class="checkout__form">
				<h4>chi tiet thanh toan</h4>

				<form:form action="checkout" method="post" modelAttribute="order">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-12">
									<div class="checkout__input">
										<p>
											ho va ten<span>*</span>
										</p>
										<form:input type="text" path="account.username"
											value="${account.username}" />
									</div>
								</div>
								
								<div class="col-lg-12">
									<div class="checkout__input">
										<p>
											so dien thoai<span>*</span>
										</p>
										<input type="text" name="phone" />
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									dia chi<span>*</span>
								</p>
								<input name="address" type="text" class="checkout__input__add" />
							</div>
							<div class="col-lg-6">
							<div class="shoping__cart__btns">
								<a href="index" class="primary-btn cart-btn">tiếp tục mua
									sắm</a>
							</div>
						</div>

						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Your Order</h4>
								<div class="checkout__order__products">
									sản phẩm <span>Tổng tiền</span>
								</div>
								<ul>
									<c:forEach var="i" items="${cart }">
										<li>${i.name }<span>${i.price }</span></li>
									</c:forEach>
									<c:set var="ship" value="${10000.0 }" />
								</ul>
								<div class="checkout__order__subtotal">
									vận chuyển <span>${ship }</span>
								</div>
								<div class="checkout__order__total">
									tổng tiền <span>${total+ship }</span>
								</div>

								<button type="submit" class="site-btn">ĐẶC HÀNG</button>
							</div>
						</div>

					</div>
				</form:form>

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