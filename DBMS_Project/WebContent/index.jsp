<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<h1>Welcome! </h1>

<p>Click on these links to access and modify the database</p>
            

<form name="myForm" action= "index.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Author Table </td> 
			<td>Book Table </td>
			<td>Copy Table</td>
			<td>Publisher Table</td>
			<td>Branch Table</td>
			<td>Wrote Table</td>
			<td>Inventory Table</td>
			<td>Search for Book by Title</td>
		</tr>
		<tr>
		<td><a href= "http://localhost:8080/DBMS_Project/selectauthor.jsp">author</a></td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectbooks.jsp">book</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectcopies.jsp">copy</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectpublisher.jsp">publisher</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectbranch.jsp">branch</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectwrote.jsp">wrote</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/selectinvent.jsp">inventory</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/specific.jsp">search</a> </td>
		</tr>
		</tbody>
		</table>
		
	</form>

</body>
</html>