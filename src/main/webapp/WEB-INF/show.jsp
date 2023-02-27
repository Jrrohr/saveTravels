<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Show Expense</title>
</head>
<body>
<h1>Expense Details</h1>
<div class="show">
	<p><b>Expense Name: </b><c:out value="${expense.name}"/></p>
	<p><b>Expense Description: </b><c:out value="${expense.description}"/></p>
	<p><b>Vendor: </b><c:out value="${expense.vendor}"/></p>
	<p><b>Amount Spent: </b>$<fmt:formatNumber type = "number" minFractionDigits = "2" value = "${expense.amount}" /></p>
</div>
<p><a href="/">Go back</a></p>
</body>
</html>