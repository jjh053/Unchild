package com.mes.project.ktw.staff.dto;

public enum Role {
	ADMIN, WORKER, UNDEFINED;
	
	public static Role fromString(String roleStr) {
        if (roleStr != null) {
            for (Role role : values()) {
                if (role.name().equalsIgnoreCase(roleStr)) {
                    return role;
                }
            }
        }
        return UNDEFINED;  
    }
}
