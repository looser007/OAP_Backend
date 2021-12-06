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
@Table(name="participant_users")
public class Participants {
	
	private String empId;
	
	private String empName;
	
	private String empEmailId;
	
	private Long assessmentId;
	
	private Date scheduleStartime;
	
	private Date scheduleEndtime;
	
	private String score;
	
	
	

}
