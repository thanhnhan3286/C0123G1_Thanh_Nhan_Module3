<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/26/2023
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1{
            padding-left: 5%;
        }
        #display{
            width: 450px;
            margin: 0 auto;
            padding: 0 30px 20px;
            background: white;
            border: solid navy 2px;
        }
    </style>
</head>
<body>
<div id="display">
    <h1>Product Description: ${description}</h1>
    <h1>List Price: ${price}</h1>
    <h1>Discount Percent: ${discount_percent} %</h1>
    <h1>Discount Amount: ${discount} %</h1>
    <h1>Discount Price: ${total}</h1>
    <button><a href="http://localhost:8080/discount.jsp">RESET</a></button>
</div>

</body>
</html>
