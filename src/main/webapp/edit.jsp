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
	<div class="edit_wrap">
		<div class="edit_head">
			<h3>${customer.name} 고객님의 정보 수정</h3>
		</div>
		<div class="bt_edit_delt">
			<a onclick="chkDelete(${customer.id}); return false;" class="info_bts">삭제</a>
		</div>
		<form name="frm" method="post" action="update?id=${customer.id}" enctype="multipart/form-data">
			<div class="card mb-3" style="max-width: 800px;">
  				<div class="row g-0">
    				<div class="col-md-4 edit_img_out">
    					<c:if test="${customer.img != null}">
      						<img src="${customer.img}" class="img-fluid rounded-start" alt="고객 사진">
      					</c:if>
      					<input type="hidden" name="origin_file" value="${customer.img}" />     					
    				</div>
    				<div class="col-md-8">
      					<div class="card-body">
        					<h4 class="card-title"><input type="text" name="name" maxlength="30" value="${customer.name}" /></h4>
        					<div class="edit_container">
        						<div class="edit_detail">
        							<p class="card-text">ID :</p>
        							<p class="card-text">주소 :</p>
        							<p class="card-text">연락처 :</p>
        							<p class="card-text">성별 :</p>
        							<p class="card-text">나이 :</p>
        							<p class="card-text">포인트 :</p>
        							<p class="card-text">등급 :</p>
        						</div>
        						<div class="edit_content">
        							<p class="card-text">${customer.id}</p>
        							<p class="card-text">
        								<input type="text" name="address" maxlength="300" value="${customer.address}" />
        							</p>
        							<p class="card-text">
        								<input type="text" name="phone" maxlength="30" value="${customer.phone}" />
        							</p>
        							<p class="card-text">
        								<label><input type="radio" name="gender" value="남" <c:if test="${customer.gender == '남'}">checked</c:if>> 남성</label>
										<label><input type="radio" name="gender" value="여" <c:if test="${customer.gender == '여'}">checked</c:if>> 여성</label>
        							</p>
        							<p class="card-text">
        								<input type="text" name="age" maxlength="10" value="${customer.age}" />
        							</p>
        							<p class="card-text">
        								<input type="text" name="point" maxlength="10" value="${customer.point}" />
        							</p>
        							<p class="card-text">
        								<select name="grade">
            								<option value="Silver" <c:if test="${customer.grade == 'Silver'}">selected</c:if>>Silver</option>
            								<option value="Gold" <c:if test="${customer.grade == 'Gold'}">selected</c:if>>Gold</option>
            								<option value="VIP" <c:if test="${customer.grade == 'VIP'}">selected</c:if>>VIP</option>
        								</select>
        							</p>
        						</div>
        					</div>
      					</div>
   		 			</div>
  				</div>
			</div>
			<div class="file_out">
				<input type="file" name="file" id="file" accept="img/*" onchange="previewImage(this);" />
			</div>
		</form>

		<div class="edit_bts">
			<a href="list" class="on">목록</a>
			<a onclick="chkForm(); return false;">수정</a>
			<a href="info?id=${customer.id}">취소</a>
		</div>
	</div>
	<script type="text/javascript" src="./js/script.js"></script>
	<script>
        function previewImage(input) {
            var preview = document.querySelector('.img-fluid');
            var file = input.files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>  
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
</body>
</html>