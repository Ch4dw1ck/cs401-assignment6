<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results</title>
</head>
<body>
<% 
	int trial = Integer.parseInt(request.getParameter("trials"));
	int trials[] = new int[trial];
	int min = Integer.parseInt(request.getParameter("min"));
	int max = Integer.parseInt(request.getParameter("max"));
	int occurs[] = new int[max+1];
%>
	N<sub>trials</sub> = <%= trial %><br/>
	N<sub>min</sub> = <%= min %> <br/>
	N<sub>max</sub> = <%= max %> <br/><br/>
	
	<h5>Occurrences:</h5>
<%	
	Random rand = new Random();
	for(int i=0; i<trial; i++) {
		trials[i] = min + rand.nextInt(max - min + 1);		
		occurs[trials[i]]++;
	}
	
	for(int i=min; i<=max; i++) { 
		float percent = ((float)occurs[i] / (float)trial) * 100; %>	
		'<%= i %>' occurred <%= occurs[i] %> time(s) in result. (<%= percent %>%)<br/>
	<% } %>
	
	<h5> Verbose output: </h5>
<%	
	for(int i=0; i<trial; i++) {
		%>Trial <%= i %> rand result: <%= trials[i] %><br/><%
		occurs[trials[i]]++;
	} 
%>

<br/>

</body>
</html>