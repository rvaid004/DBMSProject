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
<h1>Display Of All Rows From Inventory Table</h1>
<%! 
	public class Inventory
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectInvent = null ;  
		ResultSet resultSet = null ; 

		
		public Inventory(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectInvent =  connection.prepareStatement(
							"SELECT * FROM inventory") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectInvent(){
			try
			{
				resultSet = selectInvent.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Inventory i1 = new Inventory() ; 
		
		ResultSet is = i1.selectInvent() ; 
		
		
	 %>



<form name="myForm" action= "selectinvent.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Book Code </td> 
			<td>Branch Number </td>
			<td>On Hand </td>

		</tr>
		<% while(is.next()) {%>
		<tr>
			<td><%= is.getString("bookCode") %></td>
			<td><%= is.getInt("branchNum") %></td>
			<td><%= is.getInt("onHand") %></td>

		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>