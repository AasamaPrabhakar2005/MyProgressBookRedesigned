package com.sb.web.redesigned.HelloWorldSB;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Grade {
	private final SimpleIntegerProperty id;
	private final SimpleIntegerProperty quarter;
	private final SimpleStringProperty ela;
	private final SimpleStringProperty science;
	private final SimpleStringProperty hindi;
	private final SimpleStringProperty socialstudies;
	private final SimpleStringProperty math;
	public Grade(Integer id,Integer quarter,String science,String math,String socialstudies,String ela, String hindi) {
		super();
		this.id=new SimpleIntegerProperty (id);
	this.quarter=new SimpleIntegerProperty (quarter);
	this.ela=new SimpleStringProperty (ela);
	this.science=new SimpleStringProperty (science);
	this.socialstudies=new SimpleStringProperty (socialstudies);
	this.math=new SimpleStringProperty (math);
	this.hindi=new SimpleStringProperty(hindi);
	}
	public Integer getQuarter() {
		return quarter.get();
	}
	public Integer getId() {
		return id.get();
	}
	public String getEla() {
		return ela.get();
	}
	public String getHindi() {
		return hindi.get();
	}
	public String getScience() {
		return science.get();
	}
	public String getSocialstudies() {
		return socialstudies.get();
	}
	public String getMath() {
		return math.get();
	}
}
