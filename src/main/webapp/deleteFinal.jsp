<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Result</title>

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
	width: 420px;
	text-align: center;
}

h2.success {
	color: #16a34a;
	margin-bottom: 15px;
}

h2.error {
	color: #dc2626;
	margin-bottom: 15px;
}

p {
	color: #475569;
	font-size: 15px;
	margin-bottom: 25px;
}

.btn-group a {
	text-decoration: none;
	padding: 10px 18px;
	border-radius: 6px;
	font-size: 14px;
	margin: 0 6px;
	transition: 0.3s;
	display: inline-block;
}

.btn-primary {
	background-color: #0ea5e9;
	color: white;
}

.btn-primary:hover {
	background-color: #0284c7;
}

.btn-secondary {
	background-color: #64748b;
	color: white;
}

.btn-secondary:hover {
	background-color: #475569;
}
</style>

</head>
<body onload="makeActive('delete')">
	<jsp:include page="navbar.jsp" />

	<div class="container">
		<div class="card">

			<%
			String productId = request.getParameter("pid");
			PreparedStatement ps = (PreparedStatement) application.getAttribute("delete");

			try 
			{
				ps.setString(1, productId);
				int num = ps.executeUpdate();
				if (num >= 1) 
				{
			%>
			<h2 class="success">✔ Product Deleted</h2>
			<p>
				Product record with ID <strong><%=productId%></strong> has been
				deleted successfully.
			</p>
			<div class="btn-group">
				<a href="showProducts.jsp" class="btn-primary">View Products</a> <a
					href="/productManagement" class="btn-secondary">Home</a>
			</div>

			<%
			} 
			else 
			{
			%>
			<h2 class="error">❌ Not Found</h2>
			<p>
				Product record with ID <strong><%=productId%></strong> does not
				exist.
			</p>
			<div class="btn-group">
				<a href="deleteProduct.jsp" class="btn-primary">Try Again</a> <a
					href="/productManagement" class="btn-secondary">Home</a>
			</div>
			<%
			}//end of else
			}//end of try 
			catch (Exception e) 
			{
			%>
			<h2 class="error">❌ Error</h2>
			<p><%=e.getMessage()%></p>
			<%
			} 
			%>
		</div>
	</div>
</body>
</html>
