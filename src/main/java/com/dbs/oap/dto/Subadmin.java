package com.dbs.oap.dto;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="assessment_results")
public class Subadmin {
	
	private String empId;
	
	private String EmpName;
	
    private String empEmailId;
    
    private String Country;
    
    private Byte firstTimeLogged;
    
	
}
