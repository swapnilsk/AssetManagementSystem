package com.wip.asset.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {
	/*
	 * @Id
	 * 
	 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id;
	 */
	
	@Id
    private String employeeId;

    private String surname;

    private String name;

    private String mobileNumber;
    
    private String location;
    
    private String designation;

    @OneToMany(mappedBy = "employee")
    private List<Asset> assets;
	
	/*
	 * public Long getId() { return id; }
	 * 
	 * public void setId(Long id) { this.id = id; }
	 */
	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public List<Asset> getAssets() {
		return assets;
	}

	public void setAssets(List<Asset> assets) {
		this.assets = assets;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", surname=" + surname + ", name=" + name
				+ ", mobileNumber=" + mobileNumber + ", location=" + location + ", designation=" + designation + "]";
	}
}
