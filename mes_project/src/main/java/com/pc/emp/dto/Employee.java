package com.pc.emp.dto;
import java.sql.Date;

public class Employee {
	private Role role;
	private String userId;
	private String password;
	private String name;
	private int empno;
	private int deptno;
	private int sal;
	private Date hiredate;
	private String duty;
	private String mail;
	private String tel;
	
		
	// 기본 생성자
	public Employee() {
    }
	
	// 생성자
	public Employee(String userId, String password, String name, Role role) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.role = role;
	}

	// Getter와 Setter 메소드
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Role getRole() {
		return role;
	}
	
	public void setRole(Role role) {
		this.role = role;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hirdate) {
		this.hiredate = hirdate;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
