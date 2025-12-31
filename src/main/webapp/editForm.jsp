<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: linear-gradient(135deg, #ecfeff, #f8fafc);
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
	border-radius: 14px;
	width: 420px;
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
	animation: slideUp 0.6s ease;
}

@
keyframes slideUp {from { transform:translateY(40px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #0f172a;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 10px;
	font-size: 14px;
}

input[type="text"] {
	width: 100%;
	padding: 8px 10px;
	border-radius: 6px;
	border: 1px solid #cbd5e1;
	outline: none;
	transition: 0.3s;
}

input[readonly] {
	background-color: #f1f5f9;
	cursor: not-allowed;
}

input:focus {
	border-color: #0ea5e9;
	box-shadow: 0 0 0 2px rgba(14, 165, 233, 0.2);
}

button {
	background-color: #0ea5e9;
	color: white;
	border: none;
	padding: 10px 18px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 14px;
	transition: 0.3s;
}

button:hover {
	background-color: #0284c7;
	transform: translateY(-2px);
}

.error {
	text-align: center;
	background: #fee2e2;
	color: #b91c1c;
	padding: 20px;
	border-radius: 10px;
	width: 400px;
	margin: 100px auto;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12);
}
</style>

</head>
<body onload="makeActive('edit')">
	<jsp:include page="navbar.jsp" />
	<%
	String productId = request.getParameter("pid");
	PreparedStatement ps = (PreparedStatement) application.getAttribute("search");
	ps.setString(1, productId);
	ResultSet rst = ps.executeQuery();
	if (rst.next()) 
	{
	%>
	<div class="container">
		<div class="card">
			<h2>✏️ Edit Product</h2>
			<form action="editSave.jsp" method="post">
				<table>
					<tr>
						<td>Product ID</td>
						<td><input type="text" name="pid"
							value="<%=rst.getString(1)%>" readonly></td>
					</tr>
					<tr>
						<td>Edit Product Name</td>
						<td><input type="text" name="name"
							value="<%=rst.getString(2)%>" required></td>
					</tr>

					<tr>
						<td>Edit Product Brand</td>
						<td><input type="text" name="brand"
							value="<%=rst.getString(3)%>" required></td>
					</tr>
					<tr>
						<td>Edit Product Price</td>
						<td><input type="text" name="price"
							value="<%=rst.getString(4)%>" required></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<button type="submit">Update Product</button>
							<button style='background-color: gray' type="button"
								onclick="history.back()">Cancel</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%
	} 
	else 
	{
	%>
	<div class="error">
		<h2>❌ Product Not Found</h2>
		<p>
			No product exists with ID <strong><%=productId%></strong>
		</p>
	</div>
	<%
	}
	%>
</body>
</html>
