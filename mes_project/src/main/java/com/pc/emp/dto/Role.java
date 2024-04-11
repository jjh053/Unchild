package com.pc.emp.dto;

public enum Role {
	ADMIN, WORKER, UNDEFINED;

	public static Role fromString(String roleStr) {
	    if (roleStr == null) { // 입력 값이 널인지 확인
	        return UNDEFINED; // 널일 경우 UNDEFINED 반환
	    }
	    for (Role role : Role.values()) {
	        if (role.name().equalsIgnoreCase(roleStr)) {
	            return role;
	        }
	    }
	    // 모든 열거형 값을 확인했으나 일치하는 것이 없을 경우 여전히 예외를 발생
	    throw new IllegalArgumentException("Unknown role: " + roleStr);
	}
}
