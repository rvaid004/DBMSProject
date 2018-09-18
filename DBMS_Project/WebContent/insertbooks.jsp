<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "java.sql.*"  %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting Data Into HenryBooks</title>
</head>
<body onLoad= "displayResults()">
<h1>Inserting Data Into Book Table</h1>
<%! 
	public class Book
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement insertBooks = null ; 
		ResultSet resultSet = null ; 

		
		public Book(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					
					insertBooks = connection.prepareStatement(
							"INSERT INTO book VALUES (?, ?, ?, ?, ?)") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
			public int setBooks (String code, String title, String pubCode, String type, String paper){
			
				int result = 0 ; 
				
				try{
				
				insertBooks.setString(1, code) ; 
				insertBooks.setString(2, title) ; 
				insertBooks.setString(3, pubCode) ; 
				insertBooks.setString(4, type) ; 
				insertBooks.setString(5, paper) ; 
				result = insertBooks.executeUpdate() ; 
				
				}
				catch(SQLException e){
				
				e.printStackTrace(); 
				
				}
				return result ; 
			}
 
 }
 
%>

	<%
		int result = 0 ; 
	
		if(request.getParameter("submit") != null) {
			
		String btitle = new String() ; 
		String publisherCode = new String() ;
		String btype = new String() ;
		String paperback = new String() ;
		String bcode = new String() ;  

		
		if(request.getParameter("code") != null) {
			bcode = request.getParameter("code") ; 
		}
		
		if(request.getParameter("title") != null){
			
			btitle = request.getParameter("title") ; 
		}
	
		if(request.getParameter("pubCode") != null){
			
			publisherCode = request.getParameter("pubCode") ; 
		}
		

		if(request.getParameter("type") != null){
			
			btype = request.getParameter("type") ; 
		}
		

		if(request.getParameter("paper") != null){
			
			paperback = request.getParameter("paper") ; 
		}
		
		
		
		
		Book book1 = new Book() ; 
		
		result = book1.setBooks(bcode, btitle, publisherCode, btype, paperback) ; 
		}
		
	 %>



<form name="myForm" action= "insertbooks.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		
		<tr>
			<td>Book Code: </td>
			<td><input type= "text" name= "code" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>Title: </td>
			<td><input type= "text" name= "title" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>Publisher Code: </td>
			<td><input type= "text" name= "pubCode" value="" size= "50" /></td>
		</tr>
		
		<tr>
			<td>Type: </td>
			<td><input type= "text" name= "type" value="" size= "50" /></td>
		</tr>
		
		<tr>
			<td>Paperback: </td>
			<td><input type= "text" name= "paper" value="" size= "50" /></td>
		</tr>
		
		</tbody>
		</table>
		
		<input type="hidden" name="hidden" value="<%= result %>" />
		<input type="reset" value="Clear" name="clear"/>
		<input type="submit" value= "Submit" name= "submit"/>
	</form>
	
	<SCRIPT LANGUAGE= "JavaScript">
	<!--
		function displayResults()
		{
			if(document.myForm.hidden.value == 1){
				alert("Data Has Been Inserted!") ; 
			}
		
		
		}
	// -->
	</SCRIPT>
	
</body>
</html>