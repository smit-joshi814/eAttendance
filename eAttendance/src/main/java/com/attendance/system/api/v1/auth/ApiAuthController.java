package com.attendance.system.api.v1.auth;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.attendance.system.api.dtos.AuthRequest;
import com.attendance.system.api.dtos.AuthResponseFaculty;
import com.attendance.system.api.dtos.AuthResponseStudent;
import com.attendance.system.api.exceptions.ApiErrorResponse;
import com.attendance.system.api.exceptions.ApiException;
import com.attendance.system.config.jwt.JwtHelper;
import com.attendance.system.enums.Role;
import com.attendance.system.model.SiteUser;
import com.attendance.system.model.Student;
import com.attendance.system.service.StudentService;
import com.attendance.system.service.UserService;
import com.attendance.system.service.impl.UserDetailsServiceImpl;

@RestController
@RequestMapping("/api/v1/auth")
public class ApiAuthController {

	private final UserService userService;

	private final StudentService studentService;

	private final AuthenticationManager authenticationManager;

	private final UserDetailsService userDetailsService;

	private final JwtHelper jwtHelper;

	public ApiAuthController(AuthenticationManager authenticationManager, UserDetailsServiceImpl userDetailsService,
			JwtHelper jwtHelper, UserService userService, StudentService studentService) {
		this.authenticationManager = authenticationManager;
		this.userDetailsService = userDetailsService;
		this.jwtHelper = jwtHelper;
		this.userService = userService;
		this.studentService = studentService;
	}

	@PostMapping("/login")
	public ResponseEntity<?> authenticateUser(@RequestBody AuthRequest authRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		UserDetails userDetails = userDetailsService.loadUserByUsername(authRequest.getUsername());

		String token = jwtHelper.generateToken(userDetails);

		SiteUser user = userService.getUser(userDetails.getUsername()).getBody();

		if (user == null) {
			throw new ApiException(new ApiErrorResponse("Unknown username", HttpStatus.INTERNAL_SERVER_ERROR));
		}

		if (user.getRole().equals(Role.STUDENT)) {
			Student student = studentService.getStudent(user).getBody();
			if (student == null) {
				throw new ApiException(new ApiErrorResponse("Unknown username", HttpStatus.INTERNAL_SERVER_ERROR));
			}
			AuthResponseStudent response = AuthResponseStudent.builder().email(user.getEmail())
					.username(user.getUserName()).enrollment(user.getEnrollment()).token(token)
					.expiry(jwtHelper.getExpirationDateFromToken(token)).batch(student.getStudentBatch())
					.course(student.getStudentCourse()).division(student.getStudentDivision()).studentId(student.getStudentId()).build();
			return ResponseEntity.ok(response);
		}

		AuthResponseFaculty response = AuthResponseFaculty.builder().email(user.getEmail()).username(user.getUserName())
				.facultyId(user.getUserId()).enrollment(user.getEnrollment()).token(token)
				.expiry(jwtHelper.getExpirationDateFromToken(token)).build();
		return ResponseEntity.ok(response);
	}

	@GetMapping("/login")
	public ResponseEntity<String> authenticateUser() {
		return new ResponseEntity<String>("Login Using Get Request Is Not Supported", HttpStatus.METHOD_NOT_ALLOWED);
	}
	
	

}