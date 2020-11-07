package com.app.utils;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.activation.DataSource;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;

public class DB {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public DB()
	{
	}

	
	public void open() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection("jdbc:mysql://localhost/db_qzone?characterEncoding=UTF-8","root","root");		
			//
			stmt=conn.createStatement();
		} 
		catch (Exception ex) 
		{
		System.err.println("" + ex.getMessage());
		}
	}


	public void close() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
		} 
		catch (SQLException ex) 
		{
			System.err.println("Exception: " + ex.getMessage());
		}
	}

	
	public ResultSet executeQuery(String sql) throws SQLException
	{
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		return rs;
	}

	
	public int executeUpdate(String sql) throws SQLException
	{
		int ret = 0;
		ret = stmt.executeUpdate(sql);
		return ret;
	}

	
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		
//		conn.commit();
		
//		conn.setAutoCommit(isAuto);
		//conn.setAutoCommit(true);
		return updateCounts;
	}
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	
	public void commit() throws SQLException 
	{
		conn.commit();
//		this.close();
	}
	public void rollBack() throws SQLException 
	{
		conn.rollback();
//		this.close();
	}
	
}
