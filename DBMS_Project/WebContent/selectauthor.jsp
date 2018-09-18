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
<h1>Display Of All Rows From Author Table</h1>
<%! 
	public class Author
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectAuthors = null ;  
		ResultSet resultSet = null ; 

		
		public Author(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectAuthors =  connection.prepareStatement(
							"SELECT * FROM author") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectAuthors(){
			try
			{
				resultSet = selectAuthors.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Author author1 = new Author() ; 
		
		ResultSet authors = author1.selectAuthors() ; 
		
		
	 %>



<form name="myForm" action= "selectauthor.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Author Number </td> 
			<td>Last Name </td>
			<td>First Name </td>
			<td>Operation</td>
			<td>Operation</td>
			<td>Operation</td>	
		</tr>
		<% while(authors.next()) {%>
		<tr>
			<td><%= authors.getInt("authorNum") %></td>
			<td><%= authors.getString("authorLast") %></td>
			<td><%= authors.getString("authorFirst") %></td>
		<td><a href= "http://localhost:8080/DBMS_Project/insertauthor.jsp">Insert</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/deleteauthor.jsp">Delete</a> </td>
		<td><a href= "http://localhost:8080/DBMS_Project/updateAuthor.jsp">Update</a> </td>
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>