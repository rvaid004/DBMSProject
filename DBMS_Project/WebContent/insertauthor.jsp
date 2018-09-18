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
<h1>Inserting Data Into Author Table</h1>
<%! 
	public class Author
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement insertAuthors = null ; 
		ResultSet resultSet = null ; 

		
		public Author(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					
					insertAuthors = connection.prepareStatement(
							"INSERT INTO author VALUES (?, ?, ?)") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
			public int setAuthors (int number, String first, String last){
			
				int result = 0 ; 
				
				try{
				
				insertAuthors.setInt(1, number) ; 
				insertAuthors.setString(2, last) ; 
				insertAuthors.setString(3, first) ; 
				result = insertAuthors.executeUpdate() ; 
				
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
	
		String firstName = new String() ; 
		String lastName = new String() ;
		int numId = 0 ;  

		if(request.getParameter("submit") != null) {
			
		
		if(request.getParameter("number") != null) {
			numId = Integer.parseInt(request.getParameter("number")) ; 
		}
		
		if(request.getParameter("last") != null){
			
			lastName = request.getParameter("last") ; 
		}
	
		if(request.getParameter("first") != null){
			
			firstName = request.getParameter("first") ; 
		}
		
		
		
		Author author1 = new Author() ; 
		
		result = author1.setAuthors(numId, lastName, firstName) ; 
		
		}
	 %>



<form name="myForm" action= "insertauthor.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		
		<tr>
			<td>AuthorNum: </td>
			<td><input type= "number" name= "number" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>Last Name: </td>
			<td><input type= "text" name= "last" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>First Name: </td>
			<td><input type= "text" name= "first" value="" size= "50" /></td>
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