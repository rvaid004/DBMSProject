<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Selecting Specific Data from Book table</title>
</head>
<body>
<h1>Selecting Specific Data from Book table</h1>
<form name="myForm" action= "selectspecific.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		
		<tr>
			<td>Book Title: </td>
			<td><input type= "text" name= "title" value="" size= "50" /></td>

		</tr>		
		</tbody>
		</table>
		
		<input type="reset" value="Clear" name="clear"/>
		<input type="submit" value= "Submit" name= "submit"/>
	</form>
	</body>
</html>