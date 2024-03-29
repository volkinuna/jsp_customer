<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous"
/>
<link rel="stylesheet" href="./css/style.css" /> 
</head>
<body>
	<div class="list_wrap">
		<div class="customer-list">
			<h1>&lt; 고객 리스트 &gt;</h1>
		</div>
		<div class="bt_register">
			<a href="register">고객 등록</a>
		</div>
		<table class="table table-striped table-hover table-bordered customer-board">
  			<thead>
    			<tr>
      				<th scope="col" class="col-sm-1">ID</th>
      				<th scope="col" class="col-sm-2">이름</th>
      				<th scope="col" class="col-sm-4">주소</th>
      				<th scope="col" class="col-sm-3">연락처</th>
					<th scope="col" class="col-sm-1">포인트</th>
      				<th scope="col" class="col-sm-1">등급</th>
    			</tr>
  			</thead>
			<tbody class="table-group-divider">
				<c:forEach var="customer" items="${customerList}">
    				<tr onclick="window.location.href='./info?id=${customer.id}'" style="cursor: pointer;">
      					<td scope="row">${customer.id}</td>
      					<td>${customer.name}</td>
      					<td>${customer.address}</td>
      					<td>${customer.phone}</td>
      					<td>${customer.point}</td>
      					<td>${customer.grade}</td>
    				</tr>
    			</c:forEach>
  			</tbody>
		</table>
		<div class="board_page">
			<a href="#" class="bt first">&lt;&lt;</a>
			<a href="#" class="bt prev">&lt;</a>
			<a href="#" class="num on">1</a>
			<a href="#" class="num">2</a>
			<a href="#" class="num">3</a>
			<a href="#" class="num">4</a>
			<a href="#" class="num">5</a>
			<a href="#" class="bt next">&gt;</a>
			<a href="#" class="bt last">&gt;&gt;</a>
		</div>
	</div>
</body>
	<script>
		// request 객체에 error가 있을 경우 에러메세지 출력
		<c:if test="${error != null}">
			alert("${error}");
		</c:if>
		
		// 쿼리스트링에 error가 있을 경우 에러메세지 출력(쿼리스트링은 param 객체에서 가지고 온다.)
		<c:if test="${param.error != null}">
			alert("${param.error}");
		</c:if>
	</script>
</html>