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
<h1>Display Of All Rows From Publisher Table</h1>
<%! 
	public class Publisher
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectPublishers = null ;  
		ResultSet resultSet = null ; 

		
		public Publisher(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectPublishers =  connection.prepareStatement(
							"SELECT * FROM publisher") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectPublishers(){
			try
			{
				resultSet = selectPublishers.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Publisher pub1 = new Publisher() ; 
		
		ResultSet pubs = pub1.selectPublishers() ; 
		
		
	 %>



<form name="myForm" action= "selectauthor.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Publisher Code </td>
			<td>Publisher Name </td>
			<td>City </td>
			<td>Operation</td>
			<td>Operation</td>
			<td>Operation</td>
			
		</tr>
		<% while(pubs.next()) {%>
		<tr>
			<td><%= pubs.getString("publisherCode") %></td>
			<td><%= pubs.getString("publisherName") %></td>
			<td><%= pubs.getString("city") %></td>
			<td><a href= "http://localhost:8080/DBMS_Project/insertpubs.jsp">Insert</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/deletePublishers.jsp">Delete</a> </td>
			<td><a href= "http://localhost:8080/DBMS_Project/updatePublisher.jsp">Update</a> </td>
		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>