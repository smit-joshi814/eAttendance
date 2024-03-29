package com.attendance.system.api.dtos;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AuthResponseFaculty {
	private final String token;
	private final Date expiry;
	private final String username;
	private final String email;
	private final String enrollment;
	private final Long facultyId;

}
