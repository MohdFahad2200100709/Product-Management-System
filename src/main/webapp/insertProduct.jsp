<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Product</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(120deg, #e0f2fe, #f8fafc);
    }

    /* Page container (below navbar) */
    .page-container {
        min-height: calc(100vh - 70px); /* adjust if navbar height changes */
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 20px;
    }

    form {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        width: 380px;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px 5px;
        font-size: 15px;
        color: #1e293b;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #cbd5e1;
        outline: none;
        transition: 0.3s;
    }

    input[type="text"]:focus {
        border-color: #38bdf8;
        box-shadow: 0 0 6px rgba(56, 189, 248, 0.6);
    }

    button {
        background-color: #0ea5e9;
        color: white;
        padding: 10px 18px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
        transition: 0.3s;
    }

    button:hover {
        background-color: #0284c7;
        transform: translateY(-2px);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #0f172a;
    }
</style>

</head>
<body onload="makeActive('insert')">

<div class="page-container">
    <form action="saveRecord.jsp" method="post">
        <h2>Add Product</h2>
        <table>
            <tr>
                <td>Product ID</td>
                <td><input type="text" name="pid" required></td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Brand</td>
                <td><input type="text" name="brand" required></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" required></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <button type="submit">Save Record</button>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
