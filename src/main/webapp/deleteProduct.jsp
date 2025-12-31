<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>

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

    .delete-card {
        background-color: #ffffff;
        padding: 30px 35px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        width: 420px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #b91c1c;
    }

    table {
        width: 100%;
    }

    td {
        padding: 8px;
        font-size: 15px;
        color: #7f1d1d;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #fecaca;
        outline: none;
        transition: 0.3s;
    }

    input[type="text"]:focus {
        border-color: #ef4444;
        box-shadow: 0 0 6px rgba(239, 68, 68, 0.6);
    }

    button {
        background-color: #dc2626;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background-color: #b91c1c;
        transform: translateY(-2px);
    }

    .warning {
        text-align: center;
        font-size: 13px;
        color: #991b1b;
        margin-top: 10px;
    }
</style>

</head>
<body onload="makeActive('delete')">
<jsp:include page="navbar.jsp" />
<div class="container">
    <div class="delete-card">
        <h2>Delete Product</h2>

        <form action="deleteConfirm.jsp" onsubmit="return confirm('Are you sure you want to delete this product?');">
            <table>
                <tr>
                    <td>Product ID</td>
                    <td>
                        <input type="text" name="pid" required>
                    </td>
                    <td>
                        <button type="submit">Delete</button>
                    </td>
                </tr>
            </table>
        </form>

        <div class="warning">
            ⚠ This action cannot be undone.
        </div>
    </div>
</div>

</body>
</html>
