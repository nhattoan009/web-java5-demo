<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> Toanhnpc00366@fpt.edu.vn</li>
						</ul>
					</div>
				</div>
				<form:form class="col-lg-6 col-md-6" modelAttribute="account">

					<c:choose>
						<c:when test="${!isLogin }">
							<div>
								<div class="header__top__right">
									<div class="header__top__right__auth">
										<a href="login"><i class="fa fa-user"></i> dang nhap</a>
									</div>
								</div>
							</div>

						</c:when>
						<c:otherwise>
							<div>
								<div class=" header__top__right">
									<div class="header__top__right__auth">
										Xin Chào: [ ${username} ]<a href="/logout">Đăng xuất</a>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</form:form>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="index"><img src="img/logo.png" alt="photo"></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li class="active"><a href="index">TRANG CHU</a></li>

						<c:choose>
							<c:when test="${!isAdmin }">
								<li><a href="shop">CUA HANG</a></li>
								<li><a href="#">CHI TIET</a>
									<ul class="header__menu__dropdown">
										<li><a href="shopingcart">GIO HANG</a></li>
										<li><a href="checkout">THANH TOAN</a></li>
									</ul></li>
								<li><a href="contact">LIEN HE</a></li>

							</c:when>
							<c:otherwise>
								<li><a href="#">Quan ly</a>
									<ul class="header__menu__dropdown">
										<li><a href="#">Don hang</a></li>
										<li><a href="/qlcategory">Danh muc</a></li>
										<li><a href="/qlproduct">San pham</a></li>
										<li><a href="/qlaccount">Tai khoan</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<li><a href="shopinglike"><i class="fa fa-heart"></i> <span>${totalLike }</span></a></li>
						<li><a href="shopingcart"><i class="fa fa-shopping-bag"></i>
								<span>${totalCart }</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>