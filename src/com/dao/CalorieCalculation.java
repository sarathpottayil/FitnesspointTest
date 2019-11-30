package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.DataBean;
import com.dao.OperationsDAO;

public class CalorieCalculation {
	static float neededcal = 0;
	static Connection con = null;

	static ResultSet rs = null;
	static boolean flag = false;
	static PreparedStatement ps = null;

	// --------------START------database connection---------------//
	/**
	 *
	 * @author : Fitness Point
	 * @date : 05/11/2019
	 * @version: 1.1
	 * @purpose: getting database connection
	 * @param : Nothing
	 * @return : Connection
	 * 
	 */

	public static Connection getDbConnection() throws SQLException {
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	//------------------END------------------------//
	
	// --------------START------View User---------------//
		/**
		 *
		 * @author : Fitness Point
		 * @date : 05/11/2019
		 * @version: 1.1
		 * @purpose: View User
		 * @param : Nothing
		 * 
		 */

	public static ArrayList<DataBean> neededCalCalcu(String user) throws SQLException {
		ArrayList<DataBean> eb = new ArrayList<DataBean>();
		float height = 0;
		float weight = 0;
		int age = 0;
		float bmr = 0;
		String gender = "";
		try {
			con = getDbConnection();
			ps = con.prepareStatement("select u_height,u_weight,u_age,u_gender from tbl_userdata where u_username=?");
			ps.setString(1, user);
			rs = ps.executeQuery();

			DataBean dataBean = new DataBean();
			if (rs.next()) {

				height = (rs.getInt(1));
				weight = (rs.getInt(2));
				age = (rs.getInt(3));
				dataBean.setAge(age);
				gender = rs.getString(4);

			}
			if (gender.equals("male")) {
				bmr = (float) ((10 * weight) + (6.25 * height) - (5 * age) + 5);
				dataBean.setBmr(bmr);

			} else {
				bmr = (float) ((10 * weight) + (6.25 * height) - (5 * age) - 161);

			}
			if (rs.getString(5).equals("very light")) {
				neededcal = (float) (bmr * 1.2);
			} else if (rs.getString(5).equals("light")) {
				neededcal = (float) (bmr * 1.375);
			} else if (rs.getString(5).equals("Moderate")) {
				neededcal = (float) (bmr * 1.55);
			} else if (rs.getString(5).equals("Heavy")) {
				neededcal = (float) (bmr * 1.725);
			} else {
				neededcal = (float) (bmr * 1.9);
			}

			dataBean.setNeededcal(neededcal);

			eb.add(dataBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return eb;
	}
	
	//------------------END------------------------//
	
		// --------------START------Activities---------------//
			/**
			 *
			 * @author : Fitness Point
			 * @date : 05/11/2019
			 * @version: 1.1
			 * @purpose: Activities
			 * @param : Nothing
			 * 
			 */

	public static void neededCalCalculator(String user, String activity, float bmr, float fitcal) throws SQLException {

		if (activity.equals("very light")) {
			neededcal = (float) (bmr * 1.2);
		} else if (activity.equals("light")) {
			neededcal = (float) (bmr * 1.375);
		} else if (activity.equals("Moderate")) {
			neededcal = (float) (bmr * 1.55);
		} else if (activity.equals("Heavy")) {
			neededcal = (float) (bmr * 1.725);
		} else {
			neededcal = (float) (bmr * 1.9);
		}
		try {

			con = getDbConnection();

			ps = con.prepareStatement(
					"update TBL_PHYSICALDATA set P_BMR=?,P_NEEDED_CAL=?,P_FIT_CAL=? where P_USERNAME=?");

			ps.setString(4, user);
			ps.setFloat(1, bmr);
			ps.setFloat(2, neededcal);
			ps.setFloat(3, fitcal);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//------------------END------------------------//
	
	// --------------START------Calculating Weight Range---------------//
			/**
			 *
			 * @author : Fitness Point
			 * @date : 05/11/2019
			 * @version: 1.1
			 * @purpose:Calculating Weight Range 
			 * @param : Nothing
			 * 
			 */

	public static float fit(float height) {

		float upperlimit = 0;
		float lowerlimit = 0;
		if (height > 152.4 && height < 154.9) {
			upperlimit = 68.2F;
			lowerlimit = 59.1f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 154.9 && height < 157.4) {
			upperlimit = 70.5f;
			lowerlimit = 61.4f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 157.4 && height < 160) {
			upperlimit = 72.7f;
			lowerlimit = 63.6f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 160 && height < 162.5) {
			upperlimit = 75.0f;
			lowerlimit = 65.9f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 162.5 && height < 165.1) {
			upperlimit = 77.3f;
			lowerlimit = 68.2f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 165.1 && height < 167.6) {
			upperlimit = 79.5f;
			;
			lowerlimit = 70.5f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 167.6 && height < 170.1) {
			upperlimit = 81.8f;
			lowerlimit = 72.7f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 170.1 && height < 172.7) {
			upperlimit = 84.1f;
			lowerlimit = 75f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 172.7 && height < 175.2) {
			upperlimit = 86.4f;
			lowerlimit = 77.3f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 175.2 && height < 177.8) {
			upperlimit = 88.6f;
			lowerlimit = 79.5f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 177.8 && height < 180.3) {
			upperlimit = 90.9f;
			lowerlimit = 81.8f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 180.3 && height < 182.8) {
			upperlimit = 93.2f;
			lowerlimit = 84.1f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 182.8 && height < 185.4) {
			upperlimit = 95.5f;
			lowerlimit = 86.4f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 185.4 && height < 187.9) {
			upperlimit = 97.7f;
			lowerlimit = 88.6f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 187.9 && height < 190.5) {
			upperlimit = 97.7f;
			lowerlimit = 90.9f;
			return ((upperlimit + lowerlimit) / 2);
		} else if (height >= 190.5 && height <= 193.0) {
			upperlimit = 97.7f;
			lowerlimit = 93.2f;
			return ((upperlimit + lowerlimit) / 2);
		}
		return ((upperlimit + lowerlimit) / 2);
	}
	
	//------------------END------------------------//
	
		// --------------START------BMR Calculation---------------//
			/**
			 *
			 * @author : Fitness Point
			 * @date : 05/11/2019
			 * @version: 1.1
			 * @purpose: Bmr Calculation
			 * @param : Nothing
			 * 
			 */

	public static float bmrCal(String user, float weight) throws SQLException {
		float cal = 0f;
		float height = 0;
		int age = 0;
		float bmr = 0;
		float fitcal = 0;
		String gender = "";
		String activity = "";
		try {
			con = getDbConnection();
			ps = con.prepareStatement(
					"select u_height,u_age,u_gender,u_activities from tbl_userdata where u_username=?");
			ps.setString(1, user);
			rs = ps.executeQuery();
			// CalorieCalculation calo=new CalorieCalculation();

			if (rs.next()) {

				height = (rs.getInt(1));

				age = (rs.getInt(2));

				gender = rs.getString(3);
				activity = rs.getString(4);
			}

			if (gender.equals("male")) {
				bmr = (float) ((10 * weight) + (6.25 * height) - (5 * age) + 5);

			} else {
				bmr = (float) ((10 * weight) + (6.25 * height) - (5 * age) - 161);

			}
			if (activity.equals("very light")) {
				cal = (float) (bmr * 1.2);
			} else if (activity.equals("light")) {
				cal = (float) (bmr * 1.375);
			} else if (activity.equals("Moderate")) {
				cal = (float) (bmr * 1.55);
			} else if (activity.equals("Heavy")) {
				cal = (float) (bmr * 1.725);
			} else {
				cal = (float) (bmr * 1.9);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cal;
	}
	
	//------------------END------------------------//
	
		// --------------START------Calorie Calculation---------------//
			/**
			 *
			 * @author : Fitness Point
			 * @date : 05/11/2019
			 * @version: 1.1
			 * @purpose: Calorie Calculation
			 * @param : Nothing
			 * 
			 */

	public static float findcal(String user) throws SQLException {

		float cal = 0;
		float fitcal = 0;
		float difcal = 0;
		try {
			con = getDbConnection();
			ps = con.prepareStatement("select P_NEEDED_CAL,P_FIT_CAL from TBL_PHYSICALDATA where P_USERNAME=?");
			ps.setString(1, user);
			rs = ps.executeQuery();
			if (rs.next()) {

				cal = (rs.getFloat(1));
				fitcal = (rs.getFloat(2));
				difcal = cal - fitcal;
			}
			System.out.print(difcal);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return difcal;
	}
	
	//------------------END------------------------//
	
		// --------------START------View---------------//
			/**
			 *
			 * @author : Fitness Point
			 * @date : 05/11/2019
			 * @version: 1.1
			 * @purpose: View
			 * @param : Nothing
			 * 
			 */

	public static ArrayList<String> task(float diff, String gender, String user) {
		ArrayList<String> tsk = new ArrayList<String>();
		System.out.println("S2");
		System.out.println(diff);
		System.out.println(gender);
		try {
			con = getDbConnection();
			System.out.println("S3");
			if (diff > 0) {
				System.out.println("S5");
				if (gender.equalsIgnoreCase("male")) {
					System.out.println("s45");

					tsk.add("take in only 2000cal food a day");
					if (diff < 200) {
						tsk.add("walk in slow pace, 1 minute walking helps to burn 3cal");

						System.out.println("S3");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 200 && diff < 300) {
						tsk.add("do yoga, 1 minute doing yoga helps to burn 5cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'yoga','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 300 && diff < 400) {
						tsk.add("do swiming for atleast 20minutes, 1 minute swiming helps to burn 10cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'swiming','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

						tsk.add("walk in slow pace, 1 minute walking helps to burn 3cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 400) {
						System.out.println("greater");
						tsk.add("do swiming for atleast 30minutes, 1 minute swiming helps to burn 10cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'swiming','assigned')");
						System.out.println("S500");
						ps.setString(1, user);

						ps.executeUpdate();

						tsk.add("walk in slow pace for atleast 30, 1 minute walking helps to burn 3cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					}
				} else if (gender.equals("female")) {
					tsk.add("take in only 1500cal food a day");
					if (diff < 200) {
						tsk.add("walk in slow pace, 1 minute walking helps to burn 3cal");

						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 200 && diff < 300) {
						tsk.add("do yoga, 1 minute doing yoga helps to burn 5cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'yoga','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 300 && diff < 400) {
						tsk.add("do swiming for atleast 20minutes, 1 minute swiming helps to burn 10cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'swiming','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

						tsk.add("walk in slow pace, 1 minute walking helps to burn 3cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					} else if (diff >= 400) {
						tsk.add("do swiming for atleast 30minutes, 1 minute swiming helps to burn 10cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'swiming','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

						tsk.add("walk in slow pace for atleast 30, 1 minute walking helps to burn 3cal");
						ps = con.prepareStatement(
								"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

						ps.setString(1, user);

						ps.executeUpdate();

					}
				}
			} else {
				if (gender.equalsIgnoreCase("male")) {
					System.out.println("s45");

					tsk.add("take in only 2500cal as normal person and extra 500cal food as you are under weight");
					tsk.add("walk in slow pace");

					System.out.println("S3");
					ps = con.prepareStatement(
							"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

					ps.setString(1, user);

					ps.executeUpdate();
				}
				if (gender.equalsIgnoreCase("female")) {
					System.out.println("s45");

					tsk.add("take in only 2000cal as normal person and extra 500cal food as you are under weight");
					tsk.add("walk in slow pace");

					System.out.println("S3");
					ps = con.prepareStatement(
							"insert into TBL_GIVENTASK(gt_username,gt_task,gt_status)values(?,'walking slow pace','assigned')");

					ps.setString(1, user);

					ps.executeUpdate();
				}
			}
		} catch (SQLException e) {

		}
		return tsk;
	}

}
