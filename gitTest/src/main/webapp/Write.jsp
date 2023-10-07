<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
</head>
<style>
#modal {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.5);
}

#goodsSearch {
	position: absolute;
	background-color: #ffffff;
	width: 300px;
	height: 150px;
	padding: 15px;
}

#modal.hidden {
	display: none;
}
</style>
<body>
<form action="BoardWrite.do" method="post">
	<div id="board">
		<table id="list">
			<tr>
				<!-- 작성자id -->
				<td colspan="2"><input type="hidden" name="user_id" value="${info.user_id}"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<!-- 내용 입력 -->
				<td colspan="2"><textarea name="post_content" cols="55"
						rows="5"></textarea></td>
			</tr>
			<tr>
				<!-- 상품 등록(test) -->
				<td><input type="text" name="goods_id" placeholder="상품아이디 테스트"></td>
				<td><button type="button" id="modalOpenButton"
						style="float: right;">상품등록</button></td>
			</tr>
			<div id="modal" class="hidden">
				<!-- 상품등록 모달창(test) -->
				<div id="goodsSearch">
					<div>
						<input type="text" name="goods">
					</div>
					<div>상품 리스트 공간</div>
					<button id="modalCloseButton">닫기</button>
				</div>
			</div>
			<tr>
				<!-- 사진등록(test) -->
				<td><input type="text" name="post_img" placeholder="사진등록 테스트"></td>
				<td><input type="file" name="filename" style="float: right;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value = "작성완료">
				</td>
			</tr>
		</table>
	</div>
	</form>
	<script>
	const modalOpenButton = document.getElementById('modalOpenButton');
	const modalCloseButton = document.getElementById('modalCloseButton');
	const modal = document.getElementById('modal');

	modalOpenButton.addEventListener('click', () => {
	  modal.classList.remove('hidden');
	});

	modalCloseButton.addEventListener('click', () => {
	  modal.classList.add('hidden');
	});
	</script>
</body>
</html>