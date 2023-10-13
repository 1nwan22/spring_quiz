<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/css/store/storeStyle.css">
<title>가게 목록</title>
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex align-items-center">
			<h1 class="logo pl-5">배탈의 민족</h1>
		</header>
		<section class="contents">
			<div class="display-3 mt-3 mb-3">우리동네 가게</div>
			<article>
				<c:forEach items="${storeList}" var="store">
				<a href="/" class="box form-control mt-3 mb-3 h-100 p-4">
					<h2 class="font-weight-bold">
						${store.name}
					</h2>
					<div class="box-font">
						전화 번호: ${store.phoneNumber}
					</div>
					<div class="box-font">
						주소: ${store.address}
					</div>
				</a>
				</c:forEach>
			</article>
		</section>
		<hr>
		<footer>
			<h3 class="font-weight-bold">
				(주)우와한 형제
			</h3>
			<h4 class="text-secondary">
				고객센터 : 1500-1500
			</h4>
		</footer>
	</div>
</body>
</html>