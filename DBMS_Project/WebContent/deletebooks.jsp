<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "java.sql.*"  %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting Data From HenryBooks</title>
</head>
<body onLoad= "displayResults()">
<h1>Deleting Data From Book Table</h1>
<%! 
	public class Book
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectBooks = null ; 
		PreparedStatement deleteBooks = null ; 
		ResultSet resultSet = null ; 

		
		public Book(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectBooks =  connection.prepareStatement(
							"SELECT * FROM book") ; 	
					
					deleteBooks = connection.prepareStatement(
							"DELETE FROM book WHERE bookCode = ?") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet getBooks(){
			try
			{
				resultSet = selectBooks.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		public int deleteBooks(String id){
			int result = 0 ;
			
			try{
				
				deleteBooks.setString(1, id) ; 
				result = deleteBooks.executeUpdate() ;
				
			}
			
			catch(SQLException e){
				
				e.printStackTrace() ;
			}
			return result ; 
		}
 }
 
%>

	<%
		int result = 0 ; 
	
		Book book1 = new Book() ; 
		
		ResultSet books = book1.getBooks() ; 
		
		String bookId = new String() ;   

		
		if(request.getParameter("submit") != null) {
			bookId = request.getParameter("book") ;
			result = book1.deleteBooks(bookId) ; 
		}
		
		
	 %>



<form name="myForm" action= "deletebooks.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		<tr>
			<td>Book Title: </td>
			<td><select name= "book">
			<% while(books.next()) {%>
			
			<option value= "<%= books.getString("bookCode") %>"><%= books.getString("title") %></option>
			<% } %>
			
			
			</select></td>
		</tr>

		</tbody>
		</table>
		<input type="hidden" name="hidden" value="<%= result %>" />
		<input type="submit" value= "Submit" name= "submit"/>
	</form>
	
	<SCRIPT LANGUAGE= "JavaScript">
	<!--
		function displayResults()
		{
			if(document.myForm.hidden.value == 1){
				alert("Data Has Been Deleted!") ; 
			}
		
		}
	// -->
	</SCRIPT>
</body>
</html>