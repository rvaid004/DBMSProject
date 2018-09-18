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
<h1>Deleting Data From Copy Table</h1>
<%! 
	public class Copy
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectCopies = null ; 
		PreparedStatement deleteCopies = null ; 
		ResultSet resultSet = null ; 

		
		public Copy(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectCopies =  connection.prepareStatement(
							"SELECT * FROM copy") ; 	
					
					deleteCopies = connection.prepareStatement(
							"DELETE FROM copy WHERE bookCode = ?") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet getCopies(){
			try
			{
				resultSet = selectCopies.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		public int deleteCopies(String id){
			int result = 0 ;
			
			try{
				
				deleteCopies.setString(1, id) ; 
				result = deleteCopies.executeUpdate() ;
				
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
	
		Copy copy1 = new Copy() ; 
		
		ResultSet copies = copy1.getCopies() ; 
		
		String copyId = new String() ;   

		
		if(request.getParameter("submit") != null) {
			copyId = request.getParameter("copy") ;
			result = copy1.deleteCopies(copyId) ; 
		}
		
		
	 %>



<form name="myForm" action= "deletecopies.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		<tr>
			<td>Book Code: </td>
			<td><select name= "copy">
			<% while(copies.next()) {%>
			
			<option value= "<%= copies.getString("bookCode") %>"><%= copies.getString("bookCode") %></option>
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