package com.dbs.oap.dto;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="assessments")
public class Assessments {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long assessmentId;
	
	private String assessmentName;
	
	private int noQuestions;
	
	private float durationPerQuestion;
	
	private String passPercentage;
	
	private String createdBy;
	
	private String modifiedBy;
	
	private Date  createdDate;
	
	private Date modifiedDate;
	
	
	

}
