<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "java.sql.*"  %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Displaying Data From HenryBooks</title>
</head>
<body>
<h1>Display Of All Rows From Copy Table</h1>
<%! 
	public class Copy
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectCopies = null ;  
		ResultSet resultSet = null ; 

		
		public Copy(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectCopies =  connection.prepareStatement(
							"SELECT * FROM copy") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectCopies(){
			try
			{
				resultSet = selectCopies.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Copy copy1 = new Copy() ; 
		
		ResultSet copies = copy1.selectCopies() ; 
		
		
	 %>



<form name="myForm" action= "selectbooks.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Book Code </td>
			<td>Branch Num </td>
			<td>Copy Num </td>
			<td>Quality </td>
			<td>Price </td>
			<td>Operation</td>
			<td>Operation</td>
			<td>Operation</td>
			
		</tr>
		<% while(copies.next()) {%>
		<tr>
			<td><%= copies.getString("bookCode") %></td>
			<td><%= copies.getString("branchNum") %></td>
			<td><%= copies.getString("copyNum") %></td>
			<td><%= copies.getString("quality") %></td>
			<td><%= copies.getDouble("price") %></td>
			<td><a href= "http://localhost:8080/DBMS_Project/insertcopies.jsp">Insert</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/deletecopies.jsp">Delete</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/updateCopy.jsp">Update</a> </td>
		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>