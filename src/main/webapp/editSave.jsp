<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: linear-gradient(120deg, #ecfeff, #f8fafc);
}

.container {
	height: calc(100vh - 70px);
	display: flex;
	justify-content: center;
	align-items: center;
}

.result-card {
	background-color: #ffffff;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	text-align: center;
	width: 420px;
}

h2.success {
	color: #16a34a;
}

h2.error {
	color: #dc2626;
}

.a {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: white;
	background-color: #0ea5e9;
	padding: 8px 18px;
	border-radius: 6px;
	transition: 0.3s;
}

.a:hover {
	background-color: #0284c7;
	transform: translateY(-2px);
}
</style>

</head>
<body onload="makeActive('edit')">
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<div class="result-card">

			<%
			PreparedStatement ps = (PreparedStatement)application.getAttribute("update");
			ps.setString(1, request.getParameter("name"));
			ps.setString(2, request.getParameter("brand"));
			ps.setString(3, request.getParameter("price"));
			ps.setString(4, request.getParameter("pid"));
			int count = ps.executeUpdate();
			if (count >= 1) 
			{
			%>
			<h2 class="success">✅ Product Updated Successfully</h2>
			<p>
				Product ID: <strong><%=request.getParameter("pid")%></strong>
			</p>
			<%
			} 
			else 
			{
			%>
			<h2 class="error">❌ Update Failed</h2>
			<p>Product record not found.</p>
			<%
			}
			%>
			<a class='a' href="showProducts.jsp">View All Products</a>
		</div>
	</div>
</body>
</html>
