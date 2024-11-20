package com.yash.ngodonation.domain;

public class VerificationResponse {
    private boolean valid;
    private String message;

    public VerificationResponse(boolean valid, String message) {
        this.valid = valid;
        this.message = message;
    }

    // Getters and Setters
    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}