<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
    <style>
        #content{
            width: 300px;
            margin: 0 auto;
            padding: 0 30px 20px;
            background: white;
        }
        #data input{
            float: right;
            width: 10em;
            margin-bottom: 0.5em;
        }
        .select-css {
            display: block;
            font-size: 16px;
            color: #444;
            width: 100%;
            box-sizing: border-box;
            margin: 0;
            margin-left: 25%;
        }
    </style>
</head>
<body>
<div id="content">
<h1>Simple Calculator
</h1>
<form action="/calculator" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <div id="data">
            <label>First Operand:</label>
            <input type="text" name="firstOperand">
            <br>
            <div style="display: flex; margin-top:1em; border: 1px">
                <label>Operator:</label>
                <select name="operator" class="select-css">
                    <option value="+">Addition (+)</option>
                    <option value="-">Subtraction (-)</option>
                    <option value="*">Multiplication (x)</option>
                    <option value="/">Division (/)</option>
                </select>
            </div>
            <br>
            <label>Second Operand:</label>
            <input type="text" name="secondOperand">
            <input type="submit" value="Calculate">
        </div>
        <br>
        <h4>RESULT: </h4>
        <c:if test="${b != 0}">
        <h4>${a} ${c} ${b} ${equal} ${result}</h4>
        </c:if>
        <h4>${exception}</h4>
    </fieldset>

</form>

</div>
</body>
</html>