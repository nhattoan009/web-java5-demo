<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>TAT CA MAC HANG</span>
					</div>
					<ul>
						<c:forEach var="i" items="${list }">
							<li><a href="#">${i.name }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="productSearchPage">
							<input name="name" value="${keyword }" type="text" placeholder="ban muon mua gi ?">
							<button type="submit" class="site-btn">TIM KIEM</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
