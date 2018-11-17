package com.sb.web.redesigned.HelloWorldSB.ibatis.bean;

public class GradeBean {
	private Integer id;
	private Integer quarter;
	private String science;
	private String math;
	private String social_studies;
	private String ela;
	private String hindi;
	public String getHindi() {
		return hindi;
	}
	public void setHindi(String hindi) {
		this.hindi = hindi;
	}
	public GradeBean() {
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuarter() {
		return quarter;
	}
	public void setQuarter(Integer quarter) {
		this.quarter = quarter;
	}
	public String getScience() {
		return science;
	}
	public void setScience(String science) {
		this.science = science;
	}
	public String getMath() {
		return math;
	}
	public void setMath(String math) {
		this.math = math;
	}
	public String getSocial_studies() {
		return social_studies;
	}
	public void setSocial_studies(String social_studies) {
		this.social_studies = social_studies;
	}
	public String getEla() {
		return ela;
	}
	public void setEla(String ela) {
		this.ela = ela;
	}
}
