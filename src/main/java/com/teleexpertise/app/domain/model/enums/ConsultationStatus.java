package com.teleexpertise.app.domain.model.enums;


public enum ConsultationStatus {
    /**
     * Consultation en cours — créée par le médecin généraliste,
     * pas encore clôturée ni envoyée pour avis.
     */
    EN_COURS,

    /**
     * Consultation terminée — le généraliste a établi un diagnostic
     * et clôturé la consultation.
     */
    TERMINEE,

    /**
     * Consultation en attente d’un avis d’un spécialiste.
     */
    EN_ATTENTE_AVIS_SPECIALISTE,

    /**
     * Avis reçu — le spécialiste a répondu, le généraliste peut clôturer.
     */
    AVIS_RECU,

    /**
     * Consultation annulée (optionnelle selon ton flux).
     */
    ANNULEE
}
