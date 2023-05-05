<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 1/3/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới sinh viên</h1>
<a href="/student">Quay lại danh sách</a>
<p style="color: red">${mess}</p>
<form action="/student" method="post">
    <input name="action" value="create" hidden>
    <input  oninput="checkName()" name="name" placeholder="nhập tên" id="name" required><br>
    <small style="color: red" id="nameError"></small>
    <br>
    <input type="radio" name="gender" value="true"> Nam
    <input type="radio" name="gender" value="false"> Nữ<br>
    <input type="number" value="0" name="point" placeholder="nhập điểm"><br>
    <select name="classId">
        <option value="0">Chon lớp</option>
            <c:forEach var="clazz" items="${classList}">
                <option value="${clazz.id}">${clazz.name}</option>
            </c:forEach>
    </select>><br>
    <button type="submit">Save</button>
</form>
<script>
    function checkName(){
        let name = document.getElementById("name").value;
        let regexName =/^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
        if (regexName.test(name)){
            document.getElementById("nameError").innerText="";
        }else {
            document.getElementById("nameError").innerText="Tên không đúng định dạng";
        }
    }
</script>
</body>
</html>
