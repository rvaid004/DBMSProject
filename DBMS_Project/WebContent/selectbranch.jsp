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
<h1>Display Of All Rows From Branch Table</h1>
<%! 
	public class Branch
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement selectBranch = null ;  
		ResultSet resultSet = null ; 

		
		public Branch(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					selectBranch =  connection.prepareStatement(
							"SELECT * FROM branch") ; 					
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
		public ResultSet selectBranch(){
			try
			{
				resultSet = selectBranch.executeQuery() ; 
			}
			
			catch(SQLException e){
				e.printStackTrace() ;
			}
			return resultSet ; 
		}
		
		
 }
 
%>

	<%
		
	
		Branch br1 = new Branch() ; 
		
		ResultSet branches = br1.selectBranch() ; 
		
		
	 %>



<form name="myForm" action= "selectbranch.jsp" method= "POST">
	
		
		<table border = "1">
		<tbody> 
		<tr>
			<td>Branch Number </td> 
			<td>Branch Name </td>
			<td>Branch Location </td>

		</tr>
		<% while(branches.next()) {%>
		<tr>
			<td><%= branches.getInt("branchNum") %></td>
			<td><%= branches.getString("branchName") %></td>
			<td><%= branches.getString("branchLocation") %></td>

		
		</tr>
		<% } %>
		</tbody>
		</table>
		
	</form>

</body>
</html>