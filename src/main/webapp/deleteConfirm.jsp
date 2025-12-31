<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Delete</title>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: linear-gradient(120deg, #fee2e2, #fef2f2);
}

.container {
	height: calc(100vh - 70px);
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	background: #ffffff;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	width: 450px;
	text-align: center;
}

h2 {
	color: #b91c1c;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 25px;
}

td {
	padding: 10px;
	border: 1px solid #fecaca;
	font-size: 15px;
	text-align: left;
}

td.label {
	font-weight: 600;
	background-color: #fee2e2;
	width: 45%;
}

.btn-group {
	display: flex;
	justify-content: center;
	gap: 15px;
}

button, a {
	padding: 10px 18px;
	border-radius: 6px;
	text-decoration: none;
	font-size: 14px;
	cursor: pointer;
	border: none;
	transition: 0.3s;
}

.btn-danger {
	background-color: #dc2626;
	color: white;
}

.btn-danger:hover {
	background-color: #b91c1c;
}

.btn-cancel {
	background-color: #64748b;
	color: white;
}

.btn-cancel:hover {
	background-color: #475569;
}

.error {
	color: #dc2626;
	font-size: 16px;
}
</style>

</head>
<body onload="makeActive('delete')">
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="card">

			<%
			String productId = request.getParameter("pid");
			PreparedStatement ps = (PreparedStatement) application.getAttribute("search");
			ResultSet rst = null;

			try 
			{
				ps.setString(1, productId);
				rst = ps.executeQuery();
				if (rst.next()) 
				{
			%>
			<h2>Confirm Delete</h2>
			<p style="color: #7f1d1d;">Are you sure you want to delete this product?</p>
			<table>
				<tr>
					<td class="label">Product ID</td>
					<td><%=productId%></td>
				</tr>
				<tr>
					<td class="label">Product Name</td>
					<td><%=rst.getString(2)%></td>
				</tr>
				<tr>
					<td class="label">Brand</td>
					<td><%=rst.getString(3)%></td>
				</tr>
				<tr>
					<td class="label">Price</td>
					<td>₹ <%=rst.getString(4)%></td>
				</tr>
			</table>

			<div class="btn-group">
				<form action="deleteFinal.jsp">
					<input type='hidden' name='pid' value='<%=productId%>'>
					<button type="submit" class="btn-danger">Confirm Delete</button>
				</form>
				<button type="button" class="btn-cancel" onclick="history.back()">Cancel</button>
			</div>

			<%
			} 
			else 
			{
			%>

			<div class="error">
				Product with ID <strong><%=productId%></strong> not found.
			</div>
			<br>
			<button type="button" class="btn-cancel" onclick="history.back()">Go Back</button>

			<%
			} //end of else
			} //end of try 
			catch (Exception e) 
			{
			%>
			<div class="error"><%=e.getMessage()%></div>
			<%
			}//end of catch 
			finally 
			{
			  if (rst != null)
				rst.close();
			}
			%>
		</div>
	</div>
</body>
</html>
