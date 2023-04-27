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
        #display{
            width: 450px;
            margin: 0 auto;
            padding: 0 30px 20px;
            background: white;
            border: solid navy 2px;
            padding-left: 5%;
        }
        .hover:hover{
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div id="display">
    <h1>Product Description: ${description}</h1>
    <h1>List Price: ${price}</h1>
    <h1>Discount Percent: ${discount_percent} %</h1>
    <h1>Discount Amount: ${discount} </h1>
    <h1>Discount Price: ${discountPrice}</h1>
    <button class="hover"><a href="http://localhost:8080/discount.jsp" style="color: black; text-decoration: none">RETURN</a></button>
</div>

</body>
</html>
