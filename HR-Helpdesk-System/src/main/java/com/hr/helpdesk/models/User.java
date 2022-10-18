package com.hr.helpdesk.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicUpdate
public class User {

	@Id
	private String userid;
	private String uname;
	private String role;
	private String password;
	private String gender;
	private int salary;
	private String department;
	private String address;
	private String phone;
	private boolean allowedit;
	
	@ManyToOne
	@JoinColumn(name = "reportto")
	private User reportto;
	
	
	public boolean isAllowedit() {
		return allowedit;
	}
	public void setAllowedit(boolean allowedit) {
		this.allowedit = allowedit;
	}
	public User getReportto() {
		return reportto;
	}
	public void setReportto(User reportto) {
		this.reportto = reportto;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", uname=" + uname + ", role=" + role + ", password=" + password + ", gender="
				+ gender + ", salary=" + salary + ", department=" + department + ", address=" + address + ", phone="
				+ phone + "]";
	}
	
	
}
