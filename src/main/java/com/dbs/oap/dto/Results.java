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
@Table(name="assessment_results")
public class Results {
	
	private Long assessmentId;
	
	private String empEmailId;
	
	private Long questionId;
	
	private String submittedAnswer;
	
	private int result;
	

}
