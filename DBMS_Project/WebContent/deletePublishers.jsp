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
<h1>Deleting Data From Publisher Table</h1>
<%! 
	public class Publisher
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectPubs = null ; 
		PreparedStatement deletePubs = null ; 
		ResultSet resultSet = null ; 

		
		public Publisher(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectPubs =  connection.prepareStatement(
							"SELECT * FROM publisher") ; 	
					
					deletePubs = connection.prepareStatement(
							"DELETE FROM publisher WHERE publisherCode = ?") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet getPubs(){
			try
			{
				resultSet = selectPubs.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		public int deletePubs(String id){
			int result = 0 ;
			
			try{
				
				deletePubs.setString(1, id) ; 
				result = deletePubs.executeUpdate() ;
				
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
	
		Publisher pub1 = new Publisher() ; 
		
		ResultSet pubs = pub1.getPubs() ; 
		
		String pubId = new String() ;   

		
		if(request.getParameter("submit") != null) {
			pubId = request.getParameter("publisher") ;
			result = pub1.deletePubs(pubId) ; 
		}
		
		
	 %>



<form name="myForm" action= "deletePublishers.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		<tr>
			<td>Publisher Name: </td>
			<td><select name= "publisher">
			<% while(pubs.next()) {%>
			
			<option value= "<%= pubs.getString("publisherCode") %>"><%= pubs.getString("publisherName") %></option>
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