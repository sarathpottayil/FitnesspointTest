package com.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.bean.DataBean;

public class DBDAO {
	/*
	 * To change this license header, choose License Headers in Project Properties.
	 * To change this template file, choose Tools | Templates
	 * and open the template in the editor.
	 */

	    private static Connection dbCon;
		private static String dbURL;
		private static String dbDriver;
		private static String userName;
		private static String passWord;
		
	//--------------START------database initialization---------------
		/**
		 *
		 * @author : ajai
		 * @date   : 30/10/2019
		 * @version: 1.0
		 * @purpose: Initialize database connection values
		 * @param  : Nothing
		 * @return : Nothing
		 
		 */
		
		private static void dbInit(){		
				
			try{		
			
				dbDriver="oracle.jdbc.driver.OracleDriver";
				dbURL="jdbc:oracle:thin:@localhost:1521:xe";
				userName="PROJECTNEW";
				passWord="PROJECT";
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//-------------END---------database initialization---------------	
		
		
		//--------------START----------database connection ------------
		
		/**
		 *
		 * @author : ajai
		 * @date   : 30/10/2019
		 * @version: 1.0
		 * @purpose: database connection 
		 * @param  : Nothing
	         * @throws :Exception in case of missing driver class
		 * @return : Connection
		 
		 */
		
		public static void connect()throws ClassNotFoundException,SQLException{
			dbInit();
			try{
				Class.forName(dbDriver);
				//dbCon=DriverManager.getConnection(dbURL,userName,passWord);
				Connection con=DriverManager.getConnection(dbURL,userName,passWord);
				//setDbCon(dbCon);
				setDbCon(con);
			}catch(ClassNotFoundException cnfe){
				cnfe.printStackTrace();			
			}
			
		}
		
		//------------------END-------------database connection---------
		
		
		
		//--------------START----------get db connection ------------
		
			/**
		 *
		 * @author : ajai antoney
		 * @date   : 30/10/2019
		 * @version: 1.0
		 * @purpose: Get Connection
		 * @param  : Nothing
		 * @return : Connection
		 
		 */
		
		
		
		public static Connection getDbCon(){
			return dbCon;
		}
		
		//------------------END-------------get connection---------
		
		
		
		//--------------START----------set db connection ------------
		
				/**
		 *
		 * @author : ajai 
		 * @date   :  30/10/2019
		 * @version: 1.0
		 * @purpose: set connection
		 * @param  : Connection
		 * @return : Nothing
		 
		 */
			
		
		
		public static void setDbCon(Connection con){
			dbCon=con;
		}
		
		//------------------END-------------set connection---------
		
		
		
		
		//--------------START----------close connection ------------
		
		/**
		 *
		 * @author : Ajai
		 * @date   :  29/10/2019
		 * @version: 1.0
		 * @purpose: Close connection 
		 * @param  : Nothing
	         * @throws :Exception in case of closing connection
		 * @return : Nothing
		 
		 */
		
		
		
		public static void close()throws SQLException{
			dbCon.close();
		}
		
		//------------------END-------------closing connection---------
	}
































