<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<script type="text/javascript">

// 아이디 중복검사
// function idCheck(){
// 	if(myform.id.value == ""){
// 		alert('중복된 아이디입니다.');
// 	}
// 	else{
// 		alert('사용 가능한 아이디입니다.');
// 	}
// } 
	
function validation() {

    if (frm.name.value.trim() == '') {
        alert("이름을 입력해주세요");
        return false;
    }
    if (frm.pass.value.trim() == '') {
        alert("비밀번호를 입력해주세요");
        return false;
    }

    if (frm.title.value.trim() == '') {
        alert("제목을 입력해주세요");
        return false;
    }

    if (frm.content.value.trim() == '') {
        alert("내용을 입력해주세요");
        return false;
    }
    return true;
}
</script>
</head>
<body><jsp:include page="header.jsp" />
<form action="noteWrite_ok" method="post" name="frm" enctype="multipart/form-data">
<table border="1">
    <tr>
        <td>이름</td>
        <td>
            <input type="text" name="name">
        </td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pass">
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td>
            <input type="text" name="title">
        </td>
    </tr>
    <tr>
        <td>내용</td>
        <td>
            <textarea rows="5" cols="50" name="content"></textarea>
        </td>
    </tr>
    <tr>
        <td>image</td>
        <td>
            <input type="file" name="noteFile">
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="submit" onclick="return validation()">글쓰기</button>
            <input type="button" value="취소" onclick="location='noteList'">
        </td>
    </tr>
</table>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>
















