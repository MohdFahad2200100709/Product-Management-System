package com.product;

import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ConnectionListener implements ServletContextListener 
{
	//This method is called by server on startup
	public void contextInitialized(ServletContextEvent sce) 
	{
		ServletContext context=sce.getServletContext();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp2?createDatabaseIfNotExist=true","root","Fahad@123");
			Statement st=cn.createStatement();
			context.setAttribute("st", st);
			st.execute("create table if not exists products(pid int primary key,name varchar(30),brand varchar(30),price int)");
			PreparedStatement psSearch = cn.prepareStatement("select * from products where pid=?");
			context.setAttribute("search", psSearch);
			PreparedStatement psInsert = cn.prepareStatement("insert into products values(?,?,?,?)");
			context.setAttribute("insert", psInsert);
			PreparedStatement psDelete = cn.prepareStatement("delete from products where pid=?");
			context.setAttribute("delete", psDelete);
			PreparedStatement psUpdate = cn.prepareStatement("update products set name=?,brand=?,price=? where pid=?");
			context.setAttribute("update", psUpdate);
			System.out.println("Connected!");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	
}
