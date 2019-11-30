package com.dao;
import java.sql.PreparedStatement;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Connection;
import com.bean.DataBean;
public class OperationsDAO {
      static Connection con=null;
     
      static ResultSet rs=null;
	  static boolean flag=false;
	  static PreparedStatement ps=null;
	//--------------START------database connection---------------
			/**
			 *
			 * @author : Fitness Point
			 * @date   :05/11/2019
			 * @version: 1.1
			 * @purpose: getting database connection
			 * @param  : Nothing
			 * @return : Connection
			 
			 */
	      
	    
    public static Connection getDbConnection()throws SQLException{
    	try	  {
				DBDAO.connect();
				con=DBDAO.getDbCon();
		   
	  }	catch(ClassNotFoundException  ex)		   {
			 ex.printStackTrace();
		}catch(SQLException e)		{
			e.printStackTrace();
		}
		return con;
    }
    
   //-------------------------END--------------------------//
  //--------------START------DataCheck ---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:DataCheck
	 * @param  : Nothing
	 
	 */
    
 public static String dataCheck(DataBean dataBean) throws SQLException{
    	
    	String rol="";
    	flag=false;
        try{
            
            
        con=getDbConnection();
        ps=con.prepareStatement("select usr_role from tbl_login where usr_name=? and usr_pass=?");
        ps.setString(1, dataBean.getUname());
        ps.setString(2, dataBean.getPassword());
       rs=ps.executeQuery();
       flag=true;
     
       if(rs.next()){
        rol=rs.getString(1);
       }
    
        } 
        catch(Exception e){
        e.printStackTrace();
        }
        
    return rol;
   }
 
 //-------------------------END--------------------------//
 //--------------START------Insert Users Data---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert Users Data
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertUserData(DataBean dataBean) throws SQLException{
     flag=false;
      try{
          int f=0; 
          con=getDbConnection();

      ps=con.prepareStatement("update tbl_userdata set u_height=?,u_weight=?,u_activities=? where u_username=?");
      ps.setString(4, dataBean.getUname());
      ps.setInt(1, dataBean.getHeight()); 
      ps.setFloat(2, dataBean.getWeight()); 
      
      ps.setString(3, dataBean.getActivity()); 
      ps.executeUpdate();
      flag=true;
           
  } catch(Exception e){
      e.printStackTrace();
  }
  return flag;
      
}
 
 //-------------------------END--------------------------//
 //--------------START------Insert Data---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert Data
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertUser(DataBean dataBean) throws SQLException{
     flag=false;
      try{
          int f=0; String s="";
          con=getDbConnection();

          		 
          ps=con.prepareStatement("select usr_name from tbl_login");
          rs=ps.executeQuery();
           while(rs.next()){
          	 s=rs.getString(1);
          	 if(s.equalsIgnoreCase(dataBean.getUname())){
          		 f=1;
          	 }
           	
           }
           if(f==0){
      ps=con.prepareStatement("insert into tbl_login(usr_name,usr_pass,usr_role)values(?,?,?)");
      ps.setString(1, dataBean.getUname());
      ps.setString(2, dataBean.getPassword()); 
      ps.setString(3, "user"); 
      ps.executeUpdate();
      ps=con.prepareStatement("insert into tbl_userdata(u_name,u_username,u_email,u_age,u_gender)values(?,?,?,?,?)");
      ps.setString(1, dataBean.getName());
      ps.setString(2, dataBean.getUname()); 
      ps.setString(3, dataBean.getEmail()); 
      ps.setInt(4, dataBean.getAge()); 
      ps.setString(5, dataBean.getGender()); 
      ps.executeUpdate();
      ps=con.prepareStatement("insert into tbl_physicaldata(p_username)values(?)");
      ps.setString(1, dataBean.getUname());
      ps.executeUpdate();
      ps=con.prepareStatement("insert into tbl_point(p_user,p_points)values(?,0)");
      ps.setString(1, dataBean.getUname());
      ps.executeUpdate();
      
      flag=true;
           }
  } catch(Exception e){
      e.printStackTrace();
  }
  return flag;
      
}
 
 //-------------------------END--------------------------//
 //--------------START------View Profile ---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:View Profile
	 * @param  : Nothing
	 
	 */
   
 public static ArrayList<DataBean> viewProfile(String user) throws SQLException{
 	
 	ArrayList<DataBean> eb=new ArrayList<DataBean>();
     try{
         
         con=getDbConnection();
     ps=con.prepareStatement("select u_name,u_height,u_weight,u_age,u_gender,u_email,u_username from tbl_userdata where u_username=?");
     ps.setString(1, user);
     rs=ps.executeQuery();
     if(rs.next()){
     	DataBean dataBean=new DataBean();
     	dataBean.setName(rs.getString(1));
     	dataBean.setHeight(rs.getInt(2));
     	dataBean.setWeight(rs.getFloat(3));
     	dataBean.setAge(rs.getInt(4));
     	
     	dataBean.setGender(rs.getString(5));
     	dataBean.setEmail(rs.getString(6));
     	dataBean.setUname(rs.getString(7));
     	eb.add(dataBean);
     }
     }catch(Exception e){
         e.printStackTrace();
     }
     return eb;
         
}
 
 //-------------------------END--------------------------//
 //--------------START------View User Profile---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:View User Profile
	 * @param  : Nothing
	 
	 */
   

 public static ArrayList<DataBean> viewUserProfile() throws SQLException{
	 	
	 	ArrayList<DataBean> eb=new ArrayList<DataBean>();
	     try{
	         
	         con=getDbConnection();
	     ps=con.prepareStatement("select u_name,u_height,u_weight,u_age,u_gender,u_email,u_username from tbl_userdata ");
	    
	     rs=ps.executeQuery();
	     while(rs.next()){
	     	DataBean dataBean=new DataBean();
	     	dataBean.setName(rs.getString(1));
	     	dataBean.setHeight(rs.getInt(2));
	     	dataBean.setWeight(rs.getFloat(3));
	     	dataBean.setAge(rs.getInt(4));
	     	
	     	dataBean.setGender(rs.getString(5));
	     	dataBean.setEmail(rs.getString(6));
	     	dataBean.setUname(rs.getString(7));
	     	eb.add(dataBean);
	     }
	     }catch(Exception e){
	         e.printStackTrace();
	     }
	     return eb;
	         
	}
 
 //-------------------------END--------------------------//
 //--------------START------Deletion of user---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Deletion of user
	 * @param  : Nothing
	 
	 */
   

 public static boolean del(DataBean dataBean)throws SQLException{
     flag=false;
     con=getDbConnection();
     
     try{
     
         ps=con.prepareStatement("delete from tbl_login where usr_name=?");
         ps.setString(1, dataBean.getUname());
         ps.executeUpdate(); 
         ps=con.prepareStatement("delete from tbl_userdata where u_username=?");
         ps.setString(1, dataBean.getUname());
         ps.executeUpdate();
         ps=con.prepareStatement("delete from tbl_feedback where f_user=?");
         ps.setString(1, dataBean.getUname());
         ps.executeUpdate();
         
         flag=true;
     }
     catch(SQLException e){
         e.printStackTrace();
     }
     return flag;
 } 
 
 //-------------------------END--------------------------//
 //--------------START------Updation of users data---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Updation of users data
	 * @param  : Nothing
	 
	 */
   
 public static boolean updateUserData(DataBean dataBean) throws SQLException{
     flag=false;
      try{
          int f=0; 
          con=getDbConnection();
          ps=con.prepareStatement("update tbl_userdata set u_name=?,u_email=?,u_age=?,u_gender=?,u_height=?,u_weight=? where u_username=?");
          ps.setString(1, dataBean.getName());
          ps.setString(2, dataBean.getEmail()); 
          ps.setInt(3, dataBean.getAge()); 
          ps.setString(4, dataBean.getGender()); 
          ps.setInt(5, dataBean.getHeight()); 
          ps.setFloat(6, dataBean.getWeight()); 
          ps.setString(7, dataBean.getUname()); 
          ps.executeUpdate();
           flag=true;
           
  } catch(Exception e){
      e.printStackTrace();
  }
  return flag;
      
}
 
 //-------------------------END--------------------------//
 //--------------START------Insert Feedback---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert Feedback
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertFeedback(DataBean dataBean) throws SQLException{
     flag=false;
     try{
         
         con=getDbConnection();
         ps=con.prepareStatement("insert into tbl_feedback(f_user,f_date,f_comment)values(?,?,?)");
         ps.setString(1, dataBean.getUname());
         ps.setDate(2, dataBean.getDa());
         ps.setString(3, dataBean.getComment());   
         ps.executeUpdate();
       flag=true;
       
      
     }
     catch(SQLException ex){
         ex.printStackTrace();
     } 

     return flag;
}
 
 //-------------------------END--------------------------//
//--------------START------Insert Feedback---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert Feedback
	 * @param  : Nothing
	 
	 */
  
public static boolean editFeedback(DataBean dataBean) throws SQLException{
    flag=false;
    try{
        
        con=getDbConnection();
        ps=con.prepareStatement("update tbl_feedback set f_comment=? where f_id=?");
        ps.setString(1, dataBean.getComment());
        ps.setInt(2, dataBean.getSl());
        
         
        ps.executeUpdate();
      flag=true;
      
     
    }
    catch(SQLException ex){
        ex.printStackTrace();
    } 

    return flag;
}

//-------------------------END--------------------------//
 
 //--------------START------View Feedback---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:View Feedback
	 * @param  : Nothing
	 
	 */
   
 public static ArrayList<DataBean> viewFeedback() throws SQLException{
 	
 	ArrayList<DataBean> eb=new ArrayList<DataBean>();
     try{
         
         con=getDbConnection();
     ps=con.prepareStatement("select *from tbl_feedback");
    rs=ps.executeQuery();
   
     while(rs.next()){
    	DataBean dataBean=new DataBean();
     	dataBean.setSl(rs.getInt(1));
     	dataBean.setUname(rs.getString(2));
        dataBean.setComment(rs.getString(4));
    	dataBean.setDa(rs.getDate(3));
     	eb.add(dataBean);
     }
     }catch(Exception e){
         e.printStackTrace();
     }
     return eb;
         
 }
 
 //-------------------------END--------------------------//
//--------------START------View Feedback---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:View Feedback
	 * @param  : Nothing
	 
	 */
  
public static ArrayList<DataBean> userViewFeedback(String user) throws SQLException{
	
	ArrayList<DataBean> eb=new ArrayList<DataBean>();
	
    try{
        
        con=getDbConnection();
    ps=con.prepareStatement("select *from tbl_feedback where f_user=?");
    ps.setString(1,user);
   rs=ps.executeQuery();
  
    while(rs.next()){
   	DataBean dataBean=new DataBean();
    	dataBean.setSl(rs.getInt(1));
    	dataBean.setUname(rs.getString(2));
       dataBean.setComment(rs.getString(4));
   	dataBean.setDa(rs.getDate(3));
    	eb.add(dataBean);
    }
    }catch(Exception e){
        e.printStackTrace();
    }
    return eb;
        
}

//-------------------------END--------------------------//
 //--------------START------Delete Feedback---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Delete Feedback
	 * @param  : Nothing
	 
	 */
   
 public static boolean delFeedback(DataBean dataBean)throws SQLException{
	    flag=false;
	    con=getDbConnection();
	    
	    try{
	    
	        ps=con.prepareStatement("delete from tbl_feedback where f_id="+dataBean.getSl());
	        ps.executeUpdate();
	        flag=true;
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    }
	    return flag;
	} 
 
 
 //-------------------------END--------------------------//
 //--------------START------Bmi Calculation---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Bmi Calculation
	 * @param  : Nothing
	 
	 */
   
 public static ArrayList<DataBean> bmiCalculator(String user)throws SQLException{
	 ArrayList<DataBean> eb=new ArrayList<DataBean>();
	 float height=0;
	 float weight=0;
	 try{ 
         con=getDbConnection();
         ps=con.prepareStatement("select u_height,u_weight,u_age from tbl_userdata where u_username=?");
         ps.setString(1, user);
     rs=ps.executeQuery();
     DataBean dataBean=new DataBean();
     if(rs.next()){
    	 
	     	height=(rs.getInt(1));
	     	weight=(rs.getInt(2));
	     	dataBean.setAge(rs.getInt(3));
	     	height=height/100;
     }
    dataBean.setBmi(weight/(height*height));
    eb.add(dataBean);
 }
	 catch(SQLException e){
		 e.printStackTrace();
	 }
	 return eb;
}
 
 //-------------------------END--------------------------//
 //--------------START------Bmr Calculator ---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose: Bmr Calculation
	 * @param  : Nothing
	 
	 */
   
 public static ArrayList<String> bmrCalculator(String user)throws SQLException{
	 //ArrayList<DataBean> eb=new ArrayList<DataBean>();
	 ArrayList<String> tsk=null;
	 float height=0;
	 float weight=0;
	 int age=0;
	 float bmr=0;
	 float fitcal=0;
	 String gender="";
	 String activity="";
	 try{ 
         con=getDbConnection();
         ps=con.prepareStatement("select u_height,u_weight,u_age,u_gender,u_activities from tbl_userdata where u_username=?");
         ps.setString(1, user);
     rs=ps.executeQuery();
     CalorieCalculation cal=new CalorieCalculation();
     DataBean dataBean=new DataBean();
     if(rs.next()){
    	 
	     	height=(rs.getInt(1));
	     	weight=(rs.getInt(2));
	     	age=(rs.getInt(3));
	     	//dataBean.setAge(age);
	     	gender=rs.getString(4);
	     	activity=rs.getString(5);
     }
     if(gender.equals("male")){
    	 bmr=(float)((10*weight)+(6.25*height)-(5*age)+5);
    	 dataBean.setBmr(bmr);
     }
     else{
    	 bmr=(float)((10*weight)+(6.25*height)-(5*age)-161);
    	 dataBean.setBmr(bmr);
    
     }
    
     fitcal=cal.bmrCal(user,cal.fit(height));
     cal.neededCalCalculator(user,activity,bmr,fitcal);
     float diff=cal.findcal(user);
     System.out.println(diff);
     tsk=cal.task(diff,gender,user);
    
 }
	 catch(SQLException e){
		 e.printStackTrace();
	 }
	 return tsk;
}
 
 //-------------------------END--------------------------//
 //--------------START------Check Data ---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Check Data
	 * @param  : Nothing
	 
	 */
   
 public static boolean check(String user) throws SQLException{
	 String activity="";
	 float weight=0;
	 float height=0;
	 int age=0;
     flag=false;
      try{
          int f=0; 
          con=getDbConnection();

      ps=con.prepareStatement("select u_height,u_weight,u_activities,u_age from tbl_userdata where u_username=?");
      ps.setString(1, user);
      rs=ps.executeQuery();
      while(rs.next()){
    	 height=rs.getInt(1);
    	 weight=rs.getFloat(2);
    	 activity=rs.getString(3);
    	 age=rs.getInt(4);
    }
           if(age<=0||weight<=0||height<=0||activity==""||activity==null){
        	   flag=false;
           }
           else{
        	   flag=true;
           }
  } catch(Exception e){
      e.printStackTrace();
  }
  return flag;
      
}
 
 
 //-------------------------END--------------------------//
 //--------------START------Check Task---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Check Task
	 * @param  : Nothing
	 
	 */
   
 public static DataBean checkTask(String user) throws SQLException{
	String task10="";
	String task20="";
	int count=0;
	int f=0;
	int i=1;
	DataBean ob=new DataBean();
     flag=false;
      try{
          con=getDbConnection();
          ps=con.prepareStatement("select gt_username from tbl_giventask");
          rs=ps.executeQuery();
          System.out.println("1");
          while(rs.next()){
        	  if(rs.getString(1).equalsIgnoreCase(user)){
        			  System.out.println("l");
        		  flag=true;
        		  count=count+1;
        		  
        		 
        	  }
          }
          System.out.println("2nd");
          System.out.println(count);
          
          if(flag){
      ps=con.prepareStatement("select gt_task from tbl_giventask where gt_username=?");
      ps.setString(1, user);
      rs=ps.executeQuery();
      System.out.println("3rd");
     if(count==2){
    	 rs.next();
    	 task10=rs.getString(1);
    	 ob.setTask1(task10);
    	 rs.next();
     	 task20=rs.getString(1);
     	 ob.setTask2(task20);
     	ob.setCount(2);
       } 
     else if(count==1){
    	 rs.next();
    	 task10=rs.getString(1);
    	 ob.setTask1(task10);
    	 ob.setCount(1);
    	 System.out.println("one");
     }
      
     
  }
      else{
    	  ob.setCount(0);
      }
      }
      catch(Exception e){
          e.printStackTrace();
      }
  return ob;
      
}
 
 
 //-------------------------END--------------------------//
 //--------------START------Inserting time---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert time
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertTime2(DataBean dataBean)throws SQLException{
     flag=false;
     con=getDbConnection();
     
     try{
         ps=con.prepareStatement("update tbl_giventask set gt_time=? where gt_username=? and gt_task=?");
         ps.setInt(1, dataBean.getTime1());
         ps.setString(2, dataBean.getUname());
         ps.setString(3, dataBean.getTask1());
         ps.executeUpdate();
         ps=con.prepareStatement("update tbl_giventask set gt_time=? where gt_username=? and gt_task=?");
         ps.setInt(1, dataBean.getTime2());
         ps.setString(2, dataBean.getUname());
         ps.setString(3, dataBean.getTask2());
         System.out.println(dataBean.getTask2());
         System.out.println(dataBean.getTime2());
         ps.executeUpdate();
         flag=true;
     }
     catch(SQLException e){
         e.printStackTrace();
     }
     return flag;
 } 
 
 
 //-------------------------END--------------------------//
 //--------------START------Inserting Time---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Inserting time
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertTime1(DataBean dataBean)throws SQLException{
     flag=false;
     con=getDbConnection();
     
     try{
     
    	 ps=con.prepareStatement("update tbl_giventask set gt_time=? where gt_username=? and gt_task=?");
         ps.setInt(1, dataBean.getTime1());
         ps.setString(2, dataBean.getUname());
         ps.setString(3, dataBean.getTask1());
         ps.executeUpdate();
         System.out.println(dataBean.getTask1());
          System.out.println("time is"+dataBean.getTime1());
         flag=true;
     }
     catch(SQLException e){
         e.printStackTrace();
     }
     return flag;
 } 
 
 
 //-------------------------END--------------------------//
 //--------------START------Insert Points---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose: Insert Points
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertPoints(String user,String task1,String task2)throws SQLException{
	    flag=false;
	    int time1;int time2;
	    int cal1,cal2,point,totalpoint;
	    con=getDbConnection();
	    System.out.println("entered insert point");
	    try{
	    
	        ps=con.prepareStatement("select gt_time from tbl_giventask where gt_username=? and gt_task=?");
	        ps.setString(1, user);
	        ps.setString(2, task1);
	        rs=ps.executeQuery();
	        System.out.println("entered time1");
	        rs.next();
	        time1=rs.getInt(1);
	        ps=con.prepareStatement("select t_cal from tbl_task where t_task=?");
	        ps.setString(1, task1);
	        rs=ps.executeQuery();
	        System.out.println("entered time2");
	        rs.next();
	        cal1=rs.getInt(1);
	        ps=con.prepareStatement("select gt_time from tbl_giventask where gt_username=? and gt_task=?" );
	        ps.setString(1, user);
	        ps.setString(2, task2);
	        rs=ps.executeQuery();
	        rs.next();
	        System.out.println("entered task1");
	        time2=rs.getInt(1);
	        ps=con.prepareStatement("select t_cal from tbl_task where t_task=?");
	        ps.setString(1, task2);
	        rs=ps.executeQuery();
	        rs.next();
	        System.out.println("entered task2");
	        cal2=rs.getInt(1);
	       point=(cal1*time1)+(cal2*time2);
	       ps=con.prepareStatement("select p_points from tbl_point where p_user=?");
	        ps.setString(1, user);
	        rs=ps.executeQuery();
	        rs.next();
	        totalpoint=rs.getInt(1);
	        totalpoint=totalpoint+point;
	        System.out.println(totalpoint);
	       ps=con.prepareStatement("update tbl_point set p_points=? where p_user=?");
	       ps.setInt(1, totalpoint);
	       ps.setString(2, user);
	        ps.executeUpdate();
	        System.out.println("entere point in table");
	        ps=con.prepareStatement("delete from tbl_giventask where GT_USERNAME=?");
	         ps.setString(1, user);
	         ps.executeUpdate(); 
	        flag=true;
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    }
	    return flag;
	} 
 
 
 //-------------------------END--------------------------//
 //--------------START------Inserting Points---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:Insert Points
	 * @param  : Nothing
	 
	 */
   
 public static boolean insertPoints1(String user,String task1)throws SQLException{
	    flag=false;
	    int time1;
	    int cal1,point,totalpoint;
	    con=getDbConnection();
	    System.out.println("entered insert point");
	    try{
	    
	        ps=con.prepareStatement("select gt_time from tbl_giventask where gt_username=? and gt_task=?");
	        ps.setString(1, user);
	        ps.setString(2, task1);
	        rs=ps.executeQuery();
	        rs.next();
	        time1=rs.getInt(1);
	        System.out.println("entered time1");
	       
	        ps=con.prepareStatement("select t_cal from tbl_task where t_task=?");
	        ps.setString(1, task1);
	        rs=ps.executeQuery();
	        System.out.println("entered time2");
	        rs.next();
	        cal1=rs.getInt(1);
	       point=(cal1*time1);
	       System.out.println("one");
	       
	       ps=con.prepareStatement("select p_points from tbl_point where p_user=?");
	        ps.setString(1, user);
	        rs=ps.executeQuery();
	        rs.next();
	        totalpoint=rs.getInt(1);
	        totalpoint=totalpoint+point;
	        System.out.println(totalpoint);
	       ps=con.prepareStatement("update tbl_point set p_points=? where p_user=?");
	       ps.setInt(1, totalpoint);
	       ps.setString(2, user);
	        ps.executeUpdate();
	        System.out.println("entere point in table");
	        ps=con.prepareStatement("delete from tbl_giventask where GT_USERNAME=?");
	         ps.setString(1, user);
	         ps.executeUpdate(); 
	        flag=true;
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    }
	    return flag;
	}
 
 //-------------------------END--------------------------//
 //--------------START------View Points---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:View Points
	 * @param  : Nothing
	 
	 */
   
  public static int viewPoints(String user){
	  int point=0;
	  try{
	  con=getDbConnection();
	    System.out.println("entered print point");
	    
	    
	        ps=con.prepareStatement("select p_points from tbl_point where P_user=?");
	        ps.setString(1, user);
	        rs=ps.executeQuery();
	        rs.next();
	        point=rs.getInt(1);
	 
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    } return point;
  }
  
  
  //-------------------------END--------------------------//
  //--------------START------Forget Password---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose: Forget Password
	 * @param  : Nothing
	 
	 */
    
  public static String forgetPass(DataBean dataBean)throws SQLException{
	    
	    String rol=null;
	    try{
	    	con=getDbConnection();
	        ps=con.prepareStatement("select u_name from tbl_userdata where u_username=? and u_email=?");
	        ps.setString(1,dataBean.getUname());
	        ps.setString(2,dataBean.getEmail());
	        rs=ps.executeQuery();
	        flag=true;
	      
	        if(rs.next()){
	         rol=rs.getString(1);
	        }
	     
	         } 
	         catch(Exception e){
	         e.printStackTrace();
	         }
	         
	     return rol;
	} 
  
  
  //-------------------------END--------------------------//
  //--------------START------New Password---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date   :05/11/2019
	 * @version: 1.1
	 * @purpose:New Password
	 * @param  : Nothing
	 
	 */
    
	public static boolean newPassword(DataBean dataBean)throws SQLException{
	    con=getDbConnection();
	    
	    try{
	    
	        ps=con.prepareStatement("update tbl_login set usr_pass=? where usr_name=?");
	        ps.setString(1,dataBean.getPassword());
	        ps.setString(2,dataBean.getUname());
	        ps.executeUpdate();
	        flag=true;
	        
	    }
	    catch(SQLException e){
	        e.printStackTrace();
	    }
	    return flag;
	} 




//-------------------------END--------------------------//

public static String getMail(DataBean dataBean) throws SQLException{
	
	String mail="";
	flag=false;
    try{
        
        
    con=getDbConnection();
    ps=con.prepareStatement("select U.U_EMAIL FROM TBL_USERDATA U INNER JOIN TBL_FEEDBACK F ON U.U_USERNAME=F.F_USER WHERE U.U_USERNAME=?");
    ps.setString(1, dataBean.getUname());
    rs=ps.executeQuery();
    flag=true;
 
   if(rs.next()){
    mail=rs.getString(1);
   }

    } 
    catch(Exception e){
    e.printStackTrace();
    }
    
return mail;
}
}