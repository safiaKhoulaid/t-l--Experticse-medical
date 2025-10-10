package com.teleexpertise.app.domain.vo;

import org.mindrot.jbcrypt.BCrypt;

public final class Password {
    private final String hash;

    // Constructeur public pour raw password
    public Password(String rawPassword) {
        this.hash = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
    }

    // Constructeur interne pour reconstruire depuis un hash existant
   public Password(String hash, boolean fromDatabase) {  // package-private
        this.hash = hash;
    }

    public boolean matches(String rawPassword) {
        return BCrypt.checkpw(rawPassword, hash);
    }

    public String getHash() { return hash; }
}
