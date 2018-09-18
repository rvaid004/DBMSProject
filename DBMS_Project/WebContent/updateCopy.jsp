<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "java.sql.*"  %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating Data In HenryBooks</title>
</head>
<body onLoad= "displayResults()">
<h1>Updating Data In Copy Table</h1>
    
<%!
  public class UpdateCopy 
    {

                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "Gogeta32!";

                Connection connection = null;
                PreparedStatement insertCopy = null;
                ResultSet resultSet = null;


                public UpdateCopy() {
                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertCopy = connection.prepareStatement(
                                "UPDATE copy SET branchNum = ?, copyNum = ?, quality = ?, price = ?, bookCode = ?"
                                + " WHERE bookCode = ?");

                    } catch (SQLException e) 
                    {
                        e.printStackTrace();
                    }
                        
                }

                public int setCopy(int branchNum, int copyNum, String quality, double price, String code, String precode)
                {
                     int result = 0;
                     
                     try
                    {
                    	 insertCopy.setInt(1, branchNum) ;
                    	 insertCopy.setInt(2, copyNum) ; 
         				insertCopy.setString(3, quality) ; 
         				insertCopy.setDouble(4, price) ;  
         				insertCopy.setString(5, code) ; 
         				insertCopy.setString(6, precode) ;
         				result = insertCopy.executeUpdate() ; 
                    }
                    catch(SQLException e)
                    {
                        e.printStackTrace();
                    }

                  
                 return result;
            }

          
    }
    

 %> 
        
<%
        int result = 0 ; 
    	
		if(request.getParameter("submit") != null) {
			
			int bNum1 = 0 ; 
			int cNum1= 0 ;
			String qua = new String() ;
			double pri = 0.0 ;
			String bookC = new String() ; 
			String b2 = new String() ; 
		
		
			if(request.getParameter("branchNum") != null){
				
				bNum1 = Integer.parseInt(request.getParameter("branchNum")) ; 
			}
		
			if(request.getParameter("copyNum") != null){
				
				cNum1 = Integer.parseInt(request.getParameter("copyNum")) ;
			}

			if(request.getParameter("quality") != null){
				
				qua = request.getParameter("quality") ; 
			}
			

			if(request.getParameter("price") != null){
				
				pri = Double.parseDouble(request.getParameter("price")) ; 
			}
			
			
			
			if(request.getParameter("code") != null) {
				bookC = request.getParameter("code") ; 
			}
			
			
			if(request.getParameter("precode") != null){
				
				b2 = request.getParameter("precode") ;
			}
			
			
			
			
			
			UpdateCopy c1 = new UpdateCopy() ; 
			
			result = c1.setCopy(bNum1, cNum1, qua, pri, bookC, b2 ) ; 
            }

 %>
         
 <form name="myForm" action= "updateCopy.jsp" method= "POST">

  <table border = "0">
		<tbody> 
		
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
		
		<tr>
			<td>New Book Code: </td>
			<td><input type= "text" name= "code" value="" size= "50" /></td>

		</tr>
		
		<tr>
			<td>Existing Book Code: </td>
			<td><input type= "text" name= "precode" value="" size= "50" /></td>

		</tr>
				
		</tbody>
		</table>
            <input type="hidden" name="hidden" value="<%= result %>" />
            <input type="submit" value="Submit " name="submit" />
            <input type="reset" value="Clear" name="clear" />

        </form>

         <SCRIPT LANGUAGE="JavaScript">
          <!--
             function displayStatus()
             {
                 if(document.myForm.hidden.value == 1)
                 {
                     alert("Data Entered To Be Updated");
                 }
                 
             }
                
          // -->   
         </SCRIPT>
    </body>
</html>