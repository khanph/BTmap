<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<script type="text/javascript">

function validation() {

    if (frm.spotname.value.trim() == '') {
        alert("이름을 입력해주세요");
        return false;
    }
    if (frm.address.value.trim() == '') {
        alert("주소를 입력해주세요");
        return false;
    }

    if (frm.latitude.value.trim() == '') {
        alert("위도를 입력해주세요");
        return false;
    }

    if (frm.longitude.value.trim() == '') {
        alert("경도를 입력해주세요");
        return false;
    }
    return true;
}
</script>
</head>
<body class=" d-flex flex-column min-vh-100"><jsp:include page="header.jsp" />
<form action="listWrite_ok" method="post" name="frm" enctype="multipart/form-data">
<table border="1">
    <tr>
        <td>이름</td>
        <td>
            <input type="text" name="spotname">
        </td>
    </tr>
    <tr>
        <td>주소</td>
        <td> 
            <input type="text" name="address">
        </td>
    </tr>
    <tr>
        <td>설명</td>
        <td>
        	<textarea rows="10" cols="30" name="description"></textarea>
        </td>
    </tr>
    <tr>
        <td>위도</td>
        <td>
            <input type="text" name="latitude">
        </td>
    </tr>
    <tr>
        <td>경도</td>
        <td>
            <input type="text" name="longitude">
        </td>
    </tr>
<!--     <tr> -->
<!--         <td>사진 업로드</td> -->
<!--         <td> -->
<!--             <input type="file" name="img"> -->
<!--         </td> -->
<!--     </tr> -->
    <tr>
        <td colspan="2" align="center">
            <button type="submit" onclick="return validation()">저장</button>
            <input type="button" value="취소" onclick="location='noteList'">
        </td>
    </tr>
</table>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>
















