package com.teleexpertise.app.domain.vo;

import java.util.regex.Pattern;



import java.util.regex.Pattern;

public final class Email {
    private final String value;
    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    public Email(String value) {
        if (value == null || !EMAIL_PATTERN.matcher(value).matches()) {
            throw new IllegalArgumentException("Email invalide");
        }
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static Email fromString(String value) {
        return new Email(value);
    }
}

