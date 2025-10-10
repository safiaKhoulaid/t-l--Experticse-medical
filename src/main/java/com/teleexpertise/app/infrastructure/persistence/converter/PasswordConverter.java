package com.teleexpertise.app.infrastructure.persistence.converter;

import com.teleexpertise.app.domain.vo.Password;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class PasswordConverter implements AttributeConverter<Password, String> {

    @Override
    public String convertToDatabaseColumn(Password password) {
        return password != null ? password.getHash() : null;
    }

    @Override
    public Password convertToEntityAttribute(String dbData) {
        // ATTENTION : ici on ne peut pas reconstruire l'objet Password à partir du hash directement
        // car le constructeur Password génère un nouveau hash.
        // Donc il vaut mieux stocker le hash directement et utiliser un constructeur interne :
        return dbData != null ? new Password(dbData, true) : null;
    }
}
