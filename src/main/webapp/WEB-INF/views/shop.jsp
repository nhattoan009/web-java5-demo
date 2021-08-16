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
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="index">trang chu</a> <span>cua hang</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>sản phẩm giảm giá</h2>
						</div>
						<div class="row">
							<div class="product__discount__slider owl-carousel">

								<c:forEach var="i" items="${discount }">

									<div class="col-lg-4">
										<div class="product__discount__item">
											<div class="product__discount__item__pic set-bg"
												data-setbg="img/product/discount/pd-1.jpg">
												<div class="product__discount__percent">${i.discount}
													%</div>
												<ul class="product__item__pic__hover">
													<li><a href="addLike/${i.id }"><i class="fa fa-heart"></i></a></li>
													<li><a href="#"><i class="fa fa-retweet"></i></a></li>
													<li><a href="/addCart/${i.id }"><i
															class="fa fa-shopping-cart"></i></a></li>
												</ul>
											</div>
											<div class="product__discount__item__text">
												<span>${i.category.id }</span>
												<h5>
													<a href="#">${i.name }</a>
												</h5>
												<div class="product__item__price">
													${i.price - (i.price * i.discount / 100) } <span>${i.price }</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>loc</span> <select>
										<option value="0">Mới</option>
										<option value="0">Giá</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span>${pageProduct.totalElements } </span> san pham
									</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">

						<c:forEach var="i" items="${pageProduct.content }">


							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="img/product/product-2.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="/addLike/${i.id }"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="/addCart/${i.id }"><i
													class="fa fa-shopping-cart"></i></a></li>

										</ul>
									</div>
									<div class="product__item__text">
										<h6>
											<a href="#">${i.name }</a>
										</h6>
										<h5>${i.price }</h5>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="product__pagination">
						<a href="/shop?page=0"> |< </a> <a
							href="/shop?page=${pageProduct.number - 1 <0 ?0:pageProduct.number- 1 }">
							<< </a> <a
							href="/shop?page=${pageProduct.number + 1>pageProduct.totalPages-1?pageProduct.totalPages-1:pageProduct.number + 1 }">
							>> </a> <a href="/shop?page=${pageProduct.totalPages-1}"> >| </a>
						
							<div class="filter__found">
									<h6>${pageProduct.number+1} of ${pageProduct.totalPages}</h6>
							</div>
					</div>
					<%-- <li>Số thực thể hiện tại: ${pageProduct.numberOfElements}</li>
					<li>Trang số: ${pageProduct.number}</li>
					<li>Kích thước trang: ${pageProduct.size}</li>
					<li>Tổng số thực thể: ${pageProduct.totalElements}</li>
					<li>Tổng số trang: ${pageProduct.totalPages}</li> --%>

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