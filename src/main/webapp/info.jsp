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
	<div class="info_wrap">
		<div class="info_head">
			<h3>${customer.name} 고객님의 상세 정보</h3>
		</div>
		<div class="card mb-3" style="max-width: 800px;">
  			<div class="row g-0">
    			<div class="col-md-4 info_img_out">
      				<img src="${customer.img}" class="img-fluid rounded-start" alt="고객 사진">
    			</div>
    			<div class="col-md-8">
      				<div class="card-body">
        				<h4 class="card-title"><strong>${customer.name}</strong></h4>
        				<div class="info_container">
        					<div class="info_detail">
        						<p class="card-text">ID :</p>
        						<p class="card-text">주소 :</p>
        						<p class="card-text">연락처 :</p>
        						<p class="card-text">성별 :</p>       						
        						<p class="card-text">나이 :</p>       						
        						<p class="card-text">포인트 :</p>       						
        						<p class="card-text">등급 :</p>       						
        					</div>
        					<div class="info_content">
        						<p class="card-text">${customer.id}</p>
        						<p class="card-text">${customer.address}</p>
        						<p class="card-text">${customer.phone}</p>
        						<p class="card-text">${customer.gender}</p>
        						<p class="card-text">${customer.age}세</p>
        						<p class="card-text">${customer.point}점</p>
        						<p class="card-text">${customer.grade}</p>
        					</div>
        				</div>
      				</div>
   		 		</div>
  			</div>
		</div>
		<div class="info_bts">
			<a href="list" class="info_bts on">목록</a>
			<a href="edit?id=${customer.id}">수정</a>
			<a onclick="chkDelete(${customer.id}); return false;" class="info_bts">삭제</a>
		</div>
	</div>
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
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>