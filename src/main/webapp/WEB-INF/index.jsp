<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Save Travels</title>
</head>
<body>
<h1>Save Travels</h1>
<table>
    <thead>
        <tr>
            <th>Expense</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="expense" items="${allExpenses}">
			<tr>
			    <td><a href="/expenses/${expense.id}"><c:out value="${expense.name}"/></a></td>
			    <td><c:out value="${expense.vendor}"/></td>
			    <td>$<fmt:formatNumber type = "number" minFractionDigits = "2" value = "${expense.amount}" /></td>
			    <td>
			    <div class="flex">
			    	<a href="/expenses/edit/${expense.id }">Edit</a>
				    <form action="/expenses/delete/${expense.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete">
					</form>
				</div>
				</td>
			</tr>
		</c:forEach>
    </tbody>
</table>
<p>Total: $<fmt:formatNumber type = "number" minFractionDigits = "2" value = "${total}" /></p>
<h2>Add an Expense:</h2>
<form:form action="/" method="post" modelAttribute="expense" class="actualForm">
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
</body>
</html>