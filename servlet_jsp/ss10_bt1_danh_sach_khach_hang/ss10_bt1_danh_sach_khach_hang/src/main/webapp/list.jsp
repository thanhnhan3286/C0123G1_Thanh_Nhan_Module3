<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/27/2023
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        table, th, td {
            border-bottom: 2px solid black;
            border-collapse: collapse;
        }

        #display {
            width: 530px;
            margin: 0 auto;
            background: white;
            border: solid navy 2px;
            padding-left: 0%;
        }

        img {
            width: 100px;
            height: 100px;
        }

        .col-1 {
            width: 180px;
        }

        .col-2 {
            width: 100px;
        }

        .col-3 {
            width: 120px;
        }

        .text {
            text-align: left;
        }

        .text-1 {
            text-indent: 10%;
        }
    </style>
</head>
<body>
<div id="display">
    <h1 style="text-align: center">Danh sách khách hàng</h1>
    <table>
        <tr>
            <th class="col-1 text-1 text">Tên</th>
            <th class="col-3 text">Ngày sinh</th>
            <th class="col-2 text">Địa chỉ</th>
            <th class="col-3 text">Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td class="col-1 text-1">${customer.getName()}</td>
                <td class="col-3">${customer.getBirthday()}</td>
                <td class="col-2">${customer.getAddress()}</td>
                <td class="col-3">
                    <img src="${customer.getImg()}">
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
