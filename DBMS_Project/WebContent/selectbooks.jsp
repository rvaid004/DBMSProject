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
<h1>Display Of All Rows From Book Table</h1>
<%! 
	public class Book
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectBooks = null ;  
		ResultSet resultSet = null ; 

		
		public Book(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectBooks =  connection.prepareStatement(
							"SELECT * FROM book") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectBooks(){
			try
			{
				resultSet = selectBooks.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Book book1 = new Book() ; 
		
		ResultSet books = book1.selectBooks() ; 
		
		
	 %>



<form name="myForm" action= "selectbooks.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Book Code </td>
			<td>Title </td>
			<td>Publisher Code </td>
			<td>Type </td>
			<td>Paperback </td>
			<td>Operation</td>
			<td>Operation</td>
			<td>Operation</td>
		</tr>
		<% while(books.next()) {%>
		<tr>
			<td><%= books.getString("bookCode") %></td>
			<td><%= books.getString("title") %></td>
			<td><%= books.getString("publisherCode") %></td>
			<td><%= books.getString("type") %></td>
			<td><%= books.getString("paperback") %></td>
			<td><a href= "http://localhost:8080/DBMS_Project/insertbooks.jsp">Insert</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/deletebooks.jsp">Delete</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/updateBook.jsp">Update</a> </td>
		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>