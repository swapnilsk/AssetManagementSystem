package com.wip.asset.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "asset")
public class Asset {
	
	    @Id
	 	private String assetId;
	 	
	 	private String productName;
	 	
	 	private String modelName;
	 	
	 	private String productCondition;
	 	
	 	private String productColor;
	 	
	 	private String inUse;
	 	
	 	@ManyToOne
	 	@JoinColumn(name="employeeId")
	 	private Employee employee;

	/*
	 * public Long getId() { return id; }
	 * 
	 * public void setId(Long id) { this.id = id; }
	 */
		public String getAssetId() {
			return assetId;
		}

		public void setAssetId(String assetId) {
			this.assetId = assetId;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getModelName() {
			return modelName;
		}

		public void setModelName(String modelName) {
			this.modelName = modelName;
		}

		public String getProductCondition() {
			return productCondition;
		}

		public void setProductCondition(String productCondition) {
			this.productCondition = productCondition;
		}

		public String getProductColor() {
			return productColor;
		}

		public void setProductColor(String productColor) {
			this.productColor = productColor;
		}

		public String getInUse() {
			return inUse;
		}

		public void setInUse(String inUse) {
			this.inUse = inUse;
		}

		public Employee getEmployee() {
			return employee;
		}

		public void setEmployee(Employee employee) {
			this.employee = employee;
		}

		@Override
		public String toString() {
			return "Asset [assetId=" + assetId + ", productName=" + productName + ", modelName="
					+ modelName + ", productCondition=" + productCondition + ", productColor=" + productColor
					+ ", inUse=" + inUse + "]";
		}
}
