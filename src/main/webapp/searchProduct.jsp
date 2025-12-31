<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Product</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(120deg, #e0f2fe, #f8fafc);
    }

    .container {
        height: calc(100vh - 70px);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .search-card {
        background-color: #ffffff;
        padding: 30px 35px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        width: 420px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #0f172a;
    }

    table {
        width: 100%;
    }

    td {
        padding: 8px;
        font-size: 15px;
        color: #334155;
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
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background-color: #0284c7;
        transform: translateY(-2px);
    }
</style>

</head>
<body onload="makeActive('search')">

<jsp:include page="navbar.jsp" />

<div class="container">
    <div class="search-card">
        <h2>Search Product</h2>

        <form action="searchRecord.jsp" method="get">
            <table>
                <tr>
                    <td>Product ID</td>
                    <td>
                        <input type="text" name="pid" required>
                    </td>
                    <td>
                        <button type="submit">Search</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
