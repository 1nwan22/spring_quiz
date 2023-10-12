<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/weather_history/weather_history.css">
<title>날씨 정보</title>
</head>
<body>
	<div id="wrap" class="container bg-secondary">
		<div class="contents d-flex bg-success">
			<nav class="col-2 bg-warning flex-column">
				<div class="logo"></div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/weather-history-view">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/add-weather-history-view">날씨 입력</a></li>
					<li class="nav-item"><a class="nav-link" href="#">테마 날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
				</ul>
			</nav>
			<section class="history col-10 bg-primary">
				<h1>과거날씨</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherHistoryList}" var="weatherHistory">
						<tr>
							<td>
								<
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer class="bg-danger">
			
		</footer>
	</div>
</body>
</html>