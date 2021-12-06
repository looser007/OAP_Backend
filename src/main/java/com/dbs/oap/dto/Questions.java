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
@Table(name="questions")
public class Questions {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long questionId;
	
	private Long assessmentId;
	
	private int serialNo;
	
	private String questionTopic;
	
	private String questionProficiency;
	
	private String question;
	
	private String option1;
 
	private String option2;
	
	private String option3;
	
	private String option4;
	
	private String correctAnswer;
	
	
}
