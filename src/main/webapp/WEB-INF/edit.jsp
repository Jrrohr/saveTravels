<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Edit Expense</title>
</head>
<body>
<h1>Edit Expense</h1>
<form:form action="/edit/${expense.id}" method="post" modelAttribute="expense" class="actualForm">
<input type="hidden" name="_method" value="put">
<div class="flex">
	<form:label path="name">Expense Name:</form:label>
	<form:errors path="name"/>
	<form:input path="name"/>
</div>
<div class="flex">
	<form:label path="vendor">Vendor:</form:label>
	<form:errors path="vendor"/>
	<form:input path="vendor"/>
	</div>
	<div class="flex">
	<form:label path="amount">Amount:</form:label>
	<form:errors path="amount"/>
	<form:input path="amount"/>
	</div>
	<div class="flex">
	<form:label path="description">Description:</form:label>
	<form:errors path="description"/>
	<form:textarea path="description"></form:textarea>
	</div>
	<input type="submit" value="Submit">
</form:form>
<p><a href="/">Go back</a></p>
</body>
</html>