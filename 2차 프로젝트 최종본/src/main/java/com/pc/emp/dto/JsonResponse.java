package com.pc.emp.dto;

public class JsonResponse {
    private boolean success;
    private String message;

    public JsonResponse(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
     
}
