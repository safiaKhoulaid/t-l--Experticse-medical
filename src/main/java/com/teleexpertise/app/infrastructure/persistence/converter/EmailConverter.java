package com.teleexpertise.app.infrastructure.persistence.converter;



import com.teleexpertise.app.domain.vo.Email;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class EmailConverter implements AttributeConverter<Email, String> {

    @Override
    public String convertToDatabaseColumn(Email email) {
        if (email == null) return null;
        return email.getValue(); // stocke comme String
    }

    @Override
    public Email convertToEntityAttribute(String dbData) {
        if (dbData == null) return null;
        return Email.fromString(dbData); // reconstruit le VO
    }
}
