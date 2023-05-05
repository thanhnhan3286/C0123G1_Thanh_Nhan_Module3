<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 3/14/2022
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<form method="post">
    <label>ID</label>
    <input class="form-control" name="id"><br>
    <label>Name</label>
    <input class="form-control"  name="name"><br>
    <label>Gender</label>
    <select class="form-control" name="gender">
        <option value="1">Nam</option>
        <option value="0">Nữ</option>
    </select><br>
    <label>Grade</label>
    <input class="form-control" type="number" name="point"><br>
    <label>ClassId</label>
    <input class="form-control" type="number" name="classId"><br>
    <button class="btn btn-success" type="submit">Create</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
