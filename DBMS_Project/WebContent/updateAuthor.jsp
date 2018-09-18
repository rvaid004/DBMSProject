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
<h1>Updating Data In Author Table</h1>
    
       <%!
            public class Update 
    {

                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "Gogeta32!";

                Connection connection = null;
                PreparedStatement insertAuthor = null;
                ResultSet resultSet = null;

                //Constructor
                public Update() {
                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertAuthor = connection.prepareStatement(
                                "UPDATE author SET authorFirst = ?, authorLast = ?, authorNum =?"
                                + " WHERE authorNum = ?");

                    } catch (SQLException e) 
                    {
                        e.printStackTrace();
                    }
                        
                }

                public int setAuthor(String first, String last, int number, int AuthorNum1) 
                {
                     int result = 0;
                     
                     try
                    {
                        insertAuthor.setString(1, first);
                        insertAuthor.setString(2, last);
                        insertAuthor.setInt(3, number);
                        insertAuthor.setInt(4, AuthorNum1);
                        result = insertAuthor.executeUpdate();
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
            int result = 0;
            
            if(request.getParameter("submit") != null)
            {
                
            int num = 0;
            int num2 = 0;
            String first = new String();
            String last = new String();
            
            if(request.getParameter("firstName") != null)
            {
                first = request.getParameter("firstName");
            }
            
               if(request.getParameter("lastName") != null)
            {
                last = request.getParameter("lastName");
            }
                if(request.getParameter("number") != null)
            {
                num = Integer.parseInt(request.getParameter("number"));
            }
                 if(request.getParameter("authorNum1") != null)
            {
                num2 = Integer.parseInt(request.getParameter("authorNum1"));
            }
               
            
               Update up1 = new Update();
               result = up1.setAuthor(first, last, num,num2);
             
            }

         %>
         
        <form name="myForm" action="updateAuthor.jsp" method="POST">

            <table border="0">
                <tbody>
                    
                    <tr>
                        <td>Author First Name</td>
                        <td><input type="text" name="firstName" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Author Last Name</td>
                        <td><input type="text" name="lastName" value="" size="50" /></td>
                    </tr>
                     <tr>
                        <td>Author ID</td>
                        <td><input type="number" name="number" value="" required/></td>
                    </tr>
                     <tr>
                        <td>Existing Author ID</td>
                        <td><input type="number" name="authorNum1" value="" required/></td>
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