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
<h1>Inserting Data Into Copy Table</h1>
<%! 
	public class Copy
 {
		String URL = "jdbc:mysql://localhost:3306/henrybooks"  ; 
		String USERNAME = "root" ; 
		String PASSWORD = "Gogeta32!" ;
		
		Connection connection = null ; 
		PreparedStatement insertCopies = null ; 
		ResultSet resultSet = null ; 

		
		public Copy(){
		
			try{ 
					connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					
					
					insertCopies = connection.prepareStatement(
							"INSERT INTO copy VALUES (?, ?, ?, ?, ?)") ; 						
				
			}
				catch(SQLException e){
					e.printStackTrace() ; 
				}
		
		}
		
			public int setCopies (String code, int branchNum, int copyNum, String quality, double price){
			
				int result = 0 ; 
				
				try{
				
				insertCopies.setString(1, code) ; 
				insertCopies.setInt(2, branchNum) ; 
				insertCopies.setInt(3, copyNum) ; 
				insertCopies.setString(4, quality) ; 
				insertCopies.setDouble(5, price) ; 
				result = insertCopies.executeUpdate() ; 
				
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
		
		int bNum = 0 ; 
		int cNum = 0 ;
		String qual = new String() ;
		double price = 0.0 ;
		String bookCode = new String() ;  

		
		if(request.getParameter("code") != null) {
			bookCode = request.getParameter("code") ; 
		}
		
		if(request.getParameter("branchNum") != null){
			
			bNum = Integer.parseInt(request.getParameter("branchNum")) ; 
		}
	
		if(request.getParameter("copyNum") != null){
			
			cNum = Integer.parseInt(request.getParameter("copyNum")) ;
		}
		

		if(request.getParameter("quality") != null){
			
			qual = request.getParameter("quality") ; 
		}
		

		if(request.getParameter("price") != null){
			
			price = Double.parseDouble(request.getParameter("price")) ; 
		}
		
		
		
		
		Copy copy1 = new Copy() ; 
		
		result = copy1.setCopies(bookCode, bNum, cNum, qual, price) ; 
	}
	 %>



<form name="myForm" action= "insertcopies.jsp" method= "POST">
	
		<table border = "0">
		<tbody> 
		
		<tr>
			<td>Book Code: </td>
			<td><input type= "text" name= "code" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>BranchNum : </td>
			<td><input type= "number" name= "branchNum" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>CopyNum: </td>
			<td><input type= "number" name= "copyNum" value="" size= "50" /></td>
		</tr>
		
		<tr>
			<td>Quality: </td>
			<td><input type= "text" name= "quality" value="" size= "50" /></td>
		</tr>
		
		<tr>
			<td>Price: </td>
			<td><input type= "number" name= "price" value="" size= "50" /></td>
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