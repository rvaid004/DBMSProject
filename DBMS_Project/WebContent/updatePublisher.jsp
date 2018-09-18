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
<h1>Updating Data In Publisher Table</h1>
    
<%!
  public class UpdatePub 
    {

                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "Gogeta32!";

                Connection connection = null;
                PreparedStatement insertPublish = null;
                ResultSet resultSet = null;


                public UpdatePub() {
                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertPublish = connection.prepareStatement(
                                "UPDATE publisher SET publisherName = ?, city = ?, publisherCode =?"
                                + " WHERE publisherCode = ?");

                    } catch (SQLException e) 
                    {
                        e.printStackTrace();
                    }
                        
                }

                public int setPub(String name, String city, String pubcode, String prepub) 
                {
                     int result = 0;
                     
                     try
                    {
                        insertPublish.setString(1, name);
                        insertPublish.setString(2, city);
                        insertPublish.setString(3, pubcode);
                        insertPublish.setString(4, prepub);
                        result = insertPublish.executeUpdate();
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
                
            String p = new String();
            String p2 = new String();
            String nam = new String();
            String cit = new String();
            
            if(request.getParameter("name") != null)
            {
                nam = request.getParameter("name");
            }
            
               if(request.getParameter("city") != null)
            {
                cit = request.getParameter("city");
            }
                if(request.getParameter("pubcode") != null)
            {
               p = request.getParameter("pubcode");
            }
                 if(request.getParameter("prepub") != null)
            {
                p2 = request.getParameter("prepub");
            }
               
            
               UpdatePub upub1 = new UpdatePub();
               result = upub1.setPub(nam, cit, p,p2);
             
            }

         %>
         
        <form name="myForm" action="updatePublisher.jsp" method="POST">

            <table border="0">
                <tbody>
                    
                    <tr>
                        <td>Publisher Name</td>
                        <td><input type="text" name="name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><input type="text" name="city" value="" size="50" /></td>
                    </tr>
                     <tr>
                        <td>New Publisher Code</td>
                        <td><input type="text" name="pubcode" value="" required/></td>
                    </tr>
                     <tr>
                        <td>Existing Publisher Code</td>
                        <td><input type="text" name="prepub" value="" required/></td>
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