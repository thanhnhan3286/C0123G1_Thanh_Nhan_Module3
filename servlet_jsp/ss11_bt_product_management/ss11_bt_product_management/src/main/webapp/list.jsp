<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <style>
        #display{
            width: 800px;
            margin: 0 auto;
        }
    </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<div id="display">

<h1>Danh sách sản phẩm</h1>
<table class="table table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>Mã sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productsList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>
            <th>
                <button type="button" class="btn btn-danger" onclick="window.location.href='/products?action=edit&id=${product.id}'">
                    Sửa
                </button>
            </th>
            <th>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">
                    Xóa
                </button>
            </th>
        </tr>
        <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có muốn xóa ${product.name} không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                        <button type="button" class="btn btn-primary" onclick="window.location.href='/products?action=delete&id=${product.id}'">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    </tbody>
    <button class="btn btn-primary" onclick="window.location.href='/products?action=create'">Thêm mới</button>
    <br>
    <div class="d-flex">
        <form class="d-flex" action="/products" method="get">
            <input type="hidden" name="action" value="search"/>
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="productName" value="${productName}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</table>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
