<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <style>
        #add {
            width: 450px;
            margin: 0 auto;
            text-align: center;
        }

        input {
            width: 200px;
        }

        .text_left {
            text-align: left;
        }

        label {
            left: 10%;
        }
    </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<div id="add">
    <h2>
        Thêm mới sản phẩm
    </h2>
    <form method="post" class="text_left">
        <label>Mã sản phẩm</label>
        <input class="form-control" name="id"><br>
        <label>Tên sản phẩm</label>
        <input class="form-control" name="name"><br>
        <label>Giá</label>
        <input class="form-control" name="price"><br>
        <label>Mô tả sản phẩm</label>
        <input class="form-control" name="description"><br>
        <label>Nhà sản xuất</label>
        <input class="form-control" name="producer"><br>
        <button class="btn btn-success" type="submit">Create</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
