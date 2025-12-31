<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Product Management</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(120deg, #e0f2fe, #f8fafc);
    }

    .home-container {
        height: calc(100vh - 70px);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .home-container h1 {
        color: #0f172a;
        font-size: 32px;
        margin-bottom: 10px;
    }

    .home-container p {
        color: #475569;
        font-size: 17px;
    }
</style>

</head>
<body onload="makeActive('home')">
<jsp:include page="navbar.jsp" />

<div class="home-container">
    <h1>Welcome to Product Management System</h1>
    <p>Select an option from the navigation bar to continue.</p>
</div>

</body>
</html>
