<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .navbar {
        background-color: #1e293b;
        padding: 14px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    .navbar .logo {
        color: #38bdf8;
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    .navbar a {
        color: #e5e7eb;
        text-decoration: none;
        margin-left: 18px;
        padding: 8px 14px;
        border-radius: 6px;
        transition: 0.3s;
        font-size: 15px
    }

    .navbar a:hover {
        background-color: #38bdf8;
        color: #020617
    }
</style>
<head>
<script type="text/javascript">
function makeActive(link)
{
	document.getElementById(link).style.backgroundColor="#38bdf8"
	document.getElementById(link).style.color="#020617"
}
</script>
</head>
<div class="navbar">
    <div class="logo">Product Management System</div>
    <div>
        <a id="home" href="/productManagement">Home</a>
        <a id="insert" href="insertProduct.jsp">Insert Product</a>
        <a id="show" href="showProducts.jsp">Show Products</a>
        <a id="delete" href="deleteProduct.jsp">Delete Product</a>
        <a id="edit" href="editProduct.jsp">Edit Product</a>
        <a id="search" href="searchProduct.jsp">Search Product</a>
    </div>
</div>
