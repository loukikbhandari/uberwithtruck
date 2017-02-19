package com.psl.entity;

public class User {

	private long EmployeeID;
	private String EmployeeFirstName;
	private String EmployeeLastName;
	private String Username;
	private String Password;
	private String Designation;
	private String UserType;
	
	public User(){
		
	}

	public long getEmployeeID() {
		return EmployeeID;
	}

	public void setEmployeeID(long employeeID) {
		EmployeeID = employeeID;
	}

	public String getEmployeeFirstName() {
		return EmployeeFirstName;
	}

	public void setEmployeeFirstName(String employeeFirstName) {
		EmployeeFirstName = employeeFirstName;
	}

	public String getEmployeeLastName() {
		return EmployeeLastName;
	}

	public void setEmployeeLastName(String employeeLastName) {
		EmployeeLastName = employeeLastName;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getDesignation() {
		return Designation;
	}

	public void setDesignation(String designation) {
		Designation = designation;
	}

	public User(long employeeID, String employeeFirstName,
			String employeeLastName, String username, String password,
			String designation, String userType) {
		super();
		EmployeeID = employeeID;
		EmployeeFirstName = employeeFirstName;
		EmployeeLastName = employeeLastName;
		Username = username;
		Password = password;
		Designation = designation;
		UserType = userType;
	}

	public String getUserType() {
		return UserType;
	}

	public void setUserType(String userType) {
		UserType = userType;
	}
	
	
}
