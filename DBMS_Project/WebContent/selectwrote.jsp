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
<h1>Display Of All Rows From Wrote Table</h1>
<%! 
	public class Wrote
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectWrote = null ;  
		ResultSet resultSet = null ; 

		
		public Wrote(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectWrote =  connection.prepareStatement(
							"SELECT * FROM wrote") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectWrote(){
			try
			{
				resultSet = selectWrote.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Wrote wrote1 = new Wrote() ; 
		
		ResultSet ws = wrote1.selectWrote() ; 
		
		
	 %>



<form name="myForm" action= "selectwrote.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Book Code </td> 
			<td>Author Number </td>
			<td>Sequence</td>

		</tr>
		<% while(ws.next()) {%>
		<tr>
			<td><%= ws.getString("bookCode") %></td>
			<td><%= ws.getInt("authorNum") %></td>
			<td><%= ws.getInt("sequence") %></td>

		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>