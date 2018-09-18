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
<h1>Updating Data In Book Table</h1>
    
       <%!
            public class UpdateBook 
    {

                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "Gogeta32!";

                Connection connection = null;
                PreparedStatement insertBook = null;
                ResultSet resultSet = null;

                //Constructor
                public UpdateBook() {
                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertBook = connection.prepareStatement(
                                "UPDATE book SET title = ?, publisherCode = ?, type = ?, paperback = ?, bookCode = ?"
                                + " WHERE bookCode = ?");

                    } catch (SQLException e) 
                    {
                        e.printStackTrace();
                    }
                        
                }

                public int setBooks(String title, String pubCode, String type, String paper, String code,  String precode)
                {
                     int result = 0;
                     
                     try
                    {
                    	insertBook.setString(1, title) ; 
         				insertBook.setString(2, pubCode) ; 
         				insertBook.setString(3, type) ; 
         				insertBook.setString(4, paper) ; 
         				insertBook.setString(5, code) ; 
         				insertBook.setString(6, precode) ; 
         				result = insertBook.executeUpdate() ; 
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
			
		String btitle2 = new String() ; 
		String publishCode = new String() ;
		String booktype = new String() ;
		String paperb = new String() ;
		String bcode1 = new String() ;  
		String bcode2 = new String() ; 

		
		if(request.getParameter("title") != null){
			
			btitle2 = request.getParameter("title") ; 
		}
	
		if(request.getParameter("pubCode") != null){
			
			publishCode = request.getParameter("pubCode") ; 
		}
		

		if(request.getParameter("type") != null){
			
			booktype = request.getParameter("type") ; 
		}
		

		if(request.getParameter("paper") != null){
			
			paperb = request.getParameter("paper") ; 
		}
		
		
		if(request.getParameter("code") != null) {
			bcode1 = request.getParameter("code") ; 
		}
		
		if(request.getParameter("precode") != null) {
			bcode2 = request.getParameter("newcode") ; 
		}
		
            
               UpdateBook upb1 = new UpdateBook();
               result = upb1.setBooks(btitle2, publishCode, booktype, paperb, bcode1, bcode2) ;
             
            }

         %>
         
        <form name="myForm" action="updateBook.jsp" method="POST">

            <table border="0">
                <tbody>
                    
                    <tr>
                        <td>Book Title</td>
                        <td><input type="text" name="title" value="" size="50" /></td>
                    </tr>
                    <tr>
					<td>Publisher Code: </td>
					<td><input type= "text" name= "pubCode" value="" size= "50" /></td>
					</tr>
				
					<tr>
						<td>Type: </td>
						<td><input type= "text" name= "type" value="" size= "50" /></td>
					</tr>
				
					<tr>
						<td>Paperback: </td>
						<td><input type= "text" name= "paper" value="" size= "50" /></td>
					</tr>
                     <tr>
                        <td>New BookCode</td>
                        <td><input type="text" name="code" value="" size= "50" /></td>
                    </tr>
                     <tr>
                        <td>Existing BookCode</td>
                        <td><input type="text" name="precode" value="" size= "50" /></td>
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
                
             
         </SCRIPT>
    </body>
</html>