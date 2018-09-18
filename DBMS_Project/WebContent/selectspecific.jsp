<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Displaying Specific Data</title>
</head>
<body>
	<h1>Select Specific Data From Book Table</h1>
	
	<%!public class SpecBook {
		String URL = "jdbc:mysql://localhost:3306/henrybooks";
		String USERNAME = "root";
		String PASSWORD = "Gogeta32!";

		Connection connection = null;
		PreparedStatement selectbooks = null;
		ResultSet rSet = null;

		public SpecBook() {

			try {
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

				selectbooks = connection.prepareStatement(
						"SELECT b.title, a.authorLast, a.authorFirst, p.publisherName, i.onHand, c.branchName"
								+ " FROM book as b, author as a, publisher as p, wrote as w, branch as c, inventory as i" 
								+ " WHERE b.title = ? "
								+ "AND b.bookCode = w.bookCode" 
								+" AND w.authorNum = a.authorNum"
								+" AND b.bookCode = i.bookCode"
								+" AND i.branchNum = c.branchNum"
								+" AND b.publisherCode = p.publisherCode");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public ResultSet getBooks(String title) {
			try {
				selectbooks.setString(1, title);
				rSet = selectbooks.executeQuery();
			}

			catch (SQLException e) {
				e.printStackTrace();
			}
			return rSet;
		}

	}
	%>

	<%
		String booktitle = new String();

			if (request.getParameter("title") != null) {

				booktitle = request.getParameter("title");
			}

			SpecBook b1 = new SpecBook();

			ResultSet specs = b1.getBooks(booktitle);

	%>


		<table border="1">
			<tbody>
				<tr>
					<td>Title</td>
					<td>Author Last Name</td>
					<td>Author First Name</td>
					<td>Publisher Name</td>
					<td>Branch Name</td>
					<td>onHand</td>

				</tr>
				<% while (specs.next())  { %>
				<tr>
					<td><%=specs.getString("title")%></td>
					<td><%=specs.getString("authorLast")%></td>
					<td><%=specs.getString("authorFirst")%></td>
					<td><%=specs.getString("publisherName")%></td>
					<td><%=specs.getString("branchName")%></td>
					<td><%=specs.getString("onHand")%></td>

				</tr>
				<% } %>
			</tbody>
		</table>

</body>
</html>