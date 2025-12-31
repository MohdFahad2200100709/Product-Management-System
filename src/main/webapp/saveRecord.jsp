<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Saved</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(120deg, #e0f2fe, #f8fafc);
    }

    .result-container {
        height: calc(100vh - 70px);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        text-align: center;
        width: 420px;
    }

    .card h2 {
        color: #16a34a;
        margin-bottom: 10px;
    }

    .card p {
        color: #475569;
        font-size: 15px;
        margin-bottom: 25px;
    }

    .btn-group a {
        text-decoration: none;
        padding: 10px 16px;
        border-radius: 6px;
        font-size: 14px;
        margin: 0 6px;
        transition: 0.3s;
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
<body onload="makeActive('insert')">

<jsp:include page="navbar.jsp" />
<div class="result-container">
    <div class="card">

        <%
            PreparedStatement ps =(PreparedStatement)application.getAttribute("insert");
            try 
            {
                ps.setString(1, request.getParameter("pid"));
                ps.setString(2, request.getParameter("name"));
                ps.setString(3, request.getParameter("brand"));
                ps.setString(4, request.getParameter("price"));
                ps.executeUpdate();
        %>
        <h2>✔ Product Saved Successfully</h2>
        <p>The product record has been added to the database.</p>

        <div class="btn-group">
            <a href="insertProduct.jsp" class="btn-primary">Add Another</a>
            <a href="showProducts.jsp" class="btn-secondary">View Products</a>
        </div>

        <%} 
        catch (Exception e) 
        {%>
	        <h2 style="color:#dc2626;">❌ Error</h2>
    	    <p><%= e.getMessage() %></p>
		<%}%>
    </div>
</div>

</body>
</html>
