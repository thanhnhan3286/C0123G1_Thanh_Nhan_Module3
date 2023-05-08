
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<h1>Danh Sách sinh viên</h1>
<form action="/student?action=search" method="post">
    <input name="searchName" placeholder="nhập tên">
    <select name="searchClassId">
        <option value="">Chọn lớp</option>
        <c:forEach var="clazz" items="${classList}">
            <option value="${clazz.id}">${clazz.name}</option>
        </c:forEach>
    </select>
    <button type="submit">Search</button>
</form>
<a href="/student?action=create">Thêm mới</a><br>
<a href="/student?action=transaction">Transaction</a>
<p>${mess}</p>
 <table class="table table-dark">
     <tr>
         <th>STT</th>
         <th>ID</th>
         <th>Name</th>
         <th>Gender</th>
         <th>Point</th>
         <th>Rank</th>
         <th>Class name</th>
         <th>Delete</th>
     </tr>
     <c:forEach var="student" items="${studentList}" varStatus="status">
         <tr>
             <td>${status.count}</td>
             <td>${student.id}</td>
             <td>${student.name}</td>
             <c:if test="${student.gender}">
                 <td>Nam</td>
             </c:if>
             <c:if test="${!student.gender}">
                 <td>Nữ</td>
             </c:if>
             <td>${student.point}</td>
             <c:choose>
                 <c:when test="${student.point >= 8}">
                     <td>Giỏi</td>
                 </c:when>
                 <c:when test="${student.point>=7}">
                     <td>Khá</td>
                 </c:when>
                 <c:when test="${student.point>=5}">
                     <td>Trung bình</td>
                 </c:when>
                 <c:otherwise>
                     <td>Yêu sắc yếu</td>
                 </c:otherwise>
             </c:choose>

             <td>${student.clazz.name}</td>

             <td>
                 <button type="button" onclick="infoDelete('${student.id}','${student.name}')" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                     Delete
                 </button>
             </td>
         </tr>
     </c:forEach>
 </table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/student?action=delete" method="post">
                <div class="modal-body">
                    <input hidden id="deleteId" name="deleteId">
                    <span>Bạn có muốn xoá sinh viên </span><span style="color: red" id="deleteName"></span><span> không???</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name){
        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
