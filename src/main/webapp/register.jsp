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
	<div class="register_wrap">
		<div class="register_head">
			<h2>&lt; 고객 등록 &gt;</h2>
		</div>
		<form name="frm" method="post" action="insert" enctype="multipart/form-data">
			<table class="table register_board">
  				<tbody>
    				<tr>
      					<th scope="row" class="col-sm-3">이름</th>
      					<td class="col-sm-9"><input type="text" name="name" maxlength="30" placeholder="고객 이름을 입력하세요." /></td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">주소</th>
      					<td class="col-sm-9"><input type="text" name="address" maxlength="200" placeholder="주소를 입력하세요." /></td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">연락처</th>
      					<td class="col-sm-9"><input type="text" name="phone" maxlength="30" placeholder="연락처를 입력하세요." /></td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">성별</th>
      					<td class="col-sm-9">
      						<label><input type="radio" name="gender" value="남"> 남성</label>
        					<label><input type="radio" name="gender" value="여"> 여성</label>
      					</td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">나이</th>
      					<td class="col-sm-9"><input type="number" name="age" maxlength="10" /></td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">포인트</th>
      					<td class="col-sm-9"><input type="number" name="point" maxlength="10" value="100" /></td>
    				</tr>
    				<tr>
      					<th scope="row" class="col-sm-3">등급</th>
      					<td class="col-sm-9">
      						<select name="grade">
            					<option value="Silver">Silver</option>
            					<option value="Gold">Gold</option>
            					<option value="VIP">VIP</option>
        					</select>
      					</td>
    				</tr>
  				</tbody>
			</table>
			<div style="padding-top:5px;">
				<label style="font-size: 1.0rem; padding-right:15px;" for="file">사진 업로드</label>
				<input type="file" name="file" id="file" />
			</div>
		</form>
		<div class="register_bts">
			<a onclick="chkForm(); return false;" class="on">등록</a>
			<a href="list">취소</a>
		</div>
	</div>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>