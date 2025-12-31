<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Products</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(120deg, #e0f2fe, #f8fafc);
    }

    .container {
        padding: 40px;
    }

    h2 {
        text-align: center;
        color: #0f172a;
        margin-bottom: 25px;
    }

    table {
        margin: auto;
        border-collapse: collapse;
        width: 70%;
        background-color: #ffffff;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        font-size: 15px;
    }

    th {
        background-color: #1e293b;
        color: #e5e7eb;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    tr:nth-child(even) {
        background-color: #f1f5f9;
    }

    tr:hover {
        background-color: #bae6fd;
        transition: 0.3s;
    }

    td {
        color: #334155;
    }

    .no-data {
        text-align: center;
        color: #dc2626;
        font-size: 24px;
        margin-top: 30px;
    }
</style>

</head>
<body onload="makeActive('show')">
<jsp:include page="navbar.jsp" />

<div class="container">
    <h2>Product List</h2>

    <%
        Statement st=(Statement) application.getAttribute("st");
        ResultSet rst = null;
        boolean hasData = false;

        try 
        {
            rst = st.executeQuery("SELECT * FROM products");
            if (rst.next()) 
            {
                hasData = true;
    		%>
		    <table>
        	  <tr>
                 <th>Product ID</th>
                 <th>Product Name</th>
                 <th>Product Brand</th>
                 <th>Product Price</th>
              </tr>
              <%
              do 
              {%>
              <tr>
                <td><%= rst.getString(1) %></td>
                <td><%= rst.getString(2) %></td>
                <td><%= rst.getString(3) %></td>
                <td>₹ <%= rst.getString(4) %></td>
               </tr>
               <%
                }while (rst.next());
                %>
             </table>
             <%
          } //End of if
    }//End of try 
    catch (Exception e) 
    {
    %>
        <p class="no-data"><%= e.getMessage() %></p>
    <%
    }//end of catch block 
    finally 
    {
        if (rst != null)
           	rst.close();
    }//End of finally block
    if (!hasData) 
    {
    %>
        <p class="no-data">No products found in database.</p>
    <%
    }
    %>
</div>
</body>
</html>
