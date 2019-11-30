package com.bean;
import java.sql.Date;
//--------------START---------------------
	/**
	 *
	 * @author : ajai
	 * @date   : 29/10/2019
	 * @version: 1.0
	 * @purpose: Beanclass
	 * @param  : Nothing
	 * @return : Nothing
	 
	 */

public class DataBean {
	private String uname;
	private String password;
	private String role;
	private String email;
	
	private float bmr;
	private String task1;
	private String task2;
	private int count;
	private int time1;
	private int time2;
	private String name;
	private String activity;
	private String gender;
	private int cal;
	private Date da;
	private int sl;
	private int age;
	private int height;
	private float weight;
	private int id;
	private int i;
	private String message;
	private String subject;
	private float bmi;
	private String comment;
	
	public int getTime1() {
		return time1;
	}
	public void setTime1(int time1) {
		this.time1 = time1;
	}
	public int getTime2() {
		return time2;
	}
	public void setTime2(int time2) {
		this.time2 = time2;
	}
	public String getTask1() {
		return task1;
	}
	public void setTask1(String task1) {
		this.task1 = task1;
	}
	public String getTask2() {
		return task2;
	}
	public void setTask2(String task2) {
		this.task2 = task2;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private float neededcal;
	
	public float getNeededcal() {
		return neededcal;
	}
	public void setNeededcal(float neededcal) {
		this.neededcal = neededcal;
	}
	public float getBmr() {
		return bmr;
	}
	public void setBmr(float bmr) {
		this.bmr = bmr;
	}
	
	public float getBmi() {
		return bmi;
	}
	public void setBmi(float bmi) {
		this.bmi = bmi;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	
	//-----------------starting getters and setters----------
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDa() {
		return da;
	}
	public void setDa(Date da) {
		this.da = da;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setID(String io){
		 i=Integer.parseInt(io);
		 DataBean ob= new DataBean();
		 ob.setId(i);
	}
	//--------------------end gettersand setters----------
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}

}
//-------------------end--------------------