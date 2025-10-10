package com.teleexpertise.app.domain.vo;

import jakarta.persistence.Embeddable;

@Embeddable
public record Address(String street, String city, String postalCode, String country) { }

