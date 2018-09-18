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
<h1>Deleting Data From Author Table</h1>
<%! 
	public class Author
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectAuthors = null ; 
		PreparedStatement deleteAuthors = null ; 
		ResultSet resultSet = null ; 

		
		public Author(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectAuthors =  connection.prepareStatement(
							"SELECT * FROM author") ; 	
					
					deleteAuthors = connection.prepareStatement(
							"DELETE FROM author WHERE authorNum = ?") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet getAuthors(){
			try
			{
				resultSet = selectAuthors.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		public int deleteAuthors(Integer id){
			int result = 0 ;
			
			try{
				
				deleteAuthors.setInt(1, id) ; 
				result = deleteAuthors.executeUpdate() ;
				
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
	
		Author author1 = new Author() ; 
		
		ResultSet authors = author1.getAuthors() ; 
		
		Integer authorId = new Integer(0) ;   

		
		if(request.getParameter("submit") != null) {
			authorId = Integer.parseInt(request.getParameter("author")) ;
			result = author1.deleteAuthors(authorId) ; 
		}
		
		
	 %>



<form name="myForm" action= "deleteauthor.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		<tr>
			<td>Author Name: </td>
			<td><select name= "author">
			<% while(authors.next()) {%>
			
			<option value= "<%= authors.getInt("authorNum") %>"><%= authors.getString("authorLast") %> <%= authors.getString("authorFirst") %></option>
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