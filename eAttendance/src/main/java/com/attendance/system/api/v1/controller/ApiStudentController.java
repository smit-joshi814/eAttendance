package com.attendance.system.api.v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.attendance.system.service.StudentService;

@RestController
@RequestMapping("/api/v1/student")
public class ApiStudentController {

	@Autowired
	private StudentService studentService;
	
	@GetMapping("/getDivisions")
	public ResponseEntity<List<String>> getDivisions(){
		return studentService.getDivisons();
	}
}
