<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.Random" %>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Example 2</title>
	<style>
		table, th, td {
			border: 1px solid black;
		}
		
		table th, table td {
			padding-left: 5px;
			padding-right: 5px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>Trial 1</th>
			<th>Trial 2</th>
			<th>Trial 3</th>
			<th>Horizontal Sum</th>
			<th>Horizontal Average</th>
		</tr>
		<!--  store all rows for vertical calculations later -->
		<% float[] rows[] = new float[28][5]; %>
		
		<!--  25 rows of numbers -->
		<% for(int i=0; i<25; i++) { %>
			<!-- build the data for the row -->
			<%
				float row[] = new float[5];
				Random rand = new Random();
					
				row[0] = rand.nextInt(10);
				row[1] = rand.nextInt(10);
				row[2] = rand.nextInt(10);
				row[3] = (row[0] + row[1]  + row[2]); //sum
				row[4] = (row[0] + row[1]  + row[2]) / 3; //average
				
				// store the row for later
				rows[i] = row;
			%>
			<tr style="background-color: <% if(i % 2 == 0) { %>#A5A5A5<% } else { %>lightgray<% } %>;">
			<!--  5 columns -->
			<% for(int k=0; k<5; k++) { %>
				<!-- set formatting for columns -->
				<td>
					<% if(k < 4) { %>
						<%= new DecimalFormat("#").format(row[k]) %>
					<% } else { %>
						<%= new DecimalFormat("#.000").format(row[k]) %>
					<% } %>
				</td>
			
			<% } %>
			</tr>
		<% } %>
		
		<!--  Last two rows -->
		<tr style="background-color: lightgray;">
			<td></td><td></td><td></td>
			<td><strong>Vertical Sum</strong></td>
			<td>
				<% 
					float sum = 0;
					for(int i=0; i<25; i++) {
						sum += rows[i][3];
				%>
				<% } %>
				<%= new DecimalFormat("#").format(sum) %>
			</td>
		</tr>
		<tr style="background-color: #A5A5A5;">
			<td></td><td></td><td></td>
			<td><strong>Vertical Average</strong></td>
			<td>
				<% 
					float avg = 0;
					for(int i=0; i<25; i++) {
						avg += rows[i][4];
				%>
				<% } 
					avg = avg / 25;
				%>
				<%= new DecimalFormat("#.00").format(avg) %>
			</td>
		</tr>
	</table>
</body>
</html>