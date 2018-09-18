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
<h1>Inserting Data Into Publisher Table</h1>
<%! 
	public class Publisher
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement insertPubs = null ; 
		ResultSet resultSet = null ; 

		
		public Publisher(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					
					insertPubs = connection.prepareStatement(
							"INSERT INTO publisher VALUES (?, ?, ?)") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
			public int setPubs (String pubsCode, String pubName, String city){
			
				int result = 0 ; 
				
				try{
				
				insertPubs.setString(1, pubsCode) ; 
				insertPubs.setString(2, pubName) ; 
				insertPubs.setString(3, city) ; 
				result = insertPubs.executeUpdate() ; 
				
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
	
		String publishCode = new String() ; 
		String publisherName = new String() ;
		String city = new String() ;  

		if(request.getParameter("submit") != null) {
			
		
		if(request.getParameter("pubsCode") != null) {
			publishCode = request.getParameter("pubsCode") ; 
		}
		
		if(request.getParameter("pubName") != null){
			
			publisherName = request.getParameter("pubName") ; 
		}
	
		if(request.getParameter("city") != null){
			
			city = request.getParameter("city") ; 
		}
		
		
		
		Publisher pub1 = new Publisher() ; 
		
		result = pub1.setPubs(publishCode, publisherName, city) ;
		}
		
	 %>



<form name="myForm" action= "insertpubs.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		
		<tr>
			<td>Publisher Code: </td>
			<td><input type= "text" name= "pubsCode" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>Publisher Name: </td>
			<td><input type= "text" name= "pubName" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>City: </td>
			<td><input type= "text" name= "city" value="" size= "50" /></td>
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