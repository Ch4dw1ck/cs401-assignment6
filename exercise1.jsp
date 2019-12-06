<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here 2</title>
</head>
<body style="background-color: black;">
<br/>
<%

int[] numbers={1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int[] sums={1, 4, 9, 16, 25, 36, 49, 64, 81, 100};

%>

<% for(int i=0;i<=9;i++) { %>
	
	<span style="color: <% if(i % 2 == 0) { %>lightgreen<% } else { %>red<% } %>;">
	
	<% for(int j=0;j<=i;j++) { %>
		<%= numbers[j] %> <sup>2</sup> 
		
		<% if(j < i) { %>
			+
		<% } %>
		
	<% } %>
	
	<% int total = 1; %>
	
	
	
	<% if(i > 0) { %>
		= 
		
		<% total = 0; %>
		
		<% for(int k=0;k<=i;k++) { %>
			<%= (numbers[k] * numbers[k]) %>
			<% total = total + (numbers[k] * numbers[k]); %>
			<% if(k < i) { %>
				+
			<% } %>
		<% } %>
	
	<% } %>

	= 

	<%= (total) %>
	
	</span>
	
	<br />
<% } %>
</body>
</html>