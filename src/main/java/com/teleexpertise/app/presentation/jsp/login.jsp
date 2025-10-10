<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Pro - Connexion</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --color-cream: #F5F3EF;
            --color-dark: #1A1A1A;
            --color-sage: #8B9D83;
            --color-accent: #2C5F5D;
            --color-error: #C84B31;
            --font-serif: 'Cormorant Garamond', serif;
            --font-sans: 'Inter', sans-serif;
        }

        body {
            font-family: var(--font-sans);
            background-color: var(--color-cream);
            color: var(--color-dark);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .login-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            max-width: 1400px;
            width: 100%;
            min-height: 700px;
            background: white;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .login-visual {
            background: linear-gradient(135deg, var(--color-accent) 0%, var(--color-sage) 100%);
            padding: 4rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .login-visual::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        }

        .logo {
            font-family: var(--font-serif);
            font-size: 2rem;
            font-weight: 300;
            color: white;
            letter-spacing: 2px;
            z-index: 1;
        }

        .visual-content {
            z-index: 1;
        }

        .visual-title {
            font-family: var(--font-serif);
            font-size: 3.5rem;
            font-weight: 300;
            color: white;
            line-height: 1.2;
            margin-bottom: 1.5rem;
        }

        .visual-subtitle {
            font-size: 1.125rem;
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
            font-weight: 300;
        }

        .login-form-section {
            padding: 4rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header {
            margin-bottom: 3rem;
        }

        .form-title {
            font-family: var(--font-serif);
            font-size: 2.5rem;
            font-weight: 400;
            color: var(--color-dark);
            margin-bottom: 0.5rem;
        }

        .form-subtitle {
            font-size: 1rem;
            color: #666;
            font-weight: 300;
        }

        .form-group {
            margin-bottom: 2rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--color-dark);
            margin-bottom: 0.75rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .form-input {
            width: 100%;
            padding: 1rem 1.25rem;
            font-size: 1rem;
            font-family: var(--font-sans);
            border: 1px solid #E0E0E0;
            background: var(--color-cream);
            color: var(--color-dark);
            transition: all 0.3s ease;
            outline: none;
        }

        .form-input:focus {
            border-color: var(--color-accent);
            background: white;
        }

        .form-input::placeholder {
            color: #999;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .checkbox-group label {
            font-size: 0.875rem;
            color: #666;
            cursor: pointer;
        }

        .forgot-link {
            font-size: 0.875rem;
            color: var(--color-accent);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgot-link:hover {
            color: var(--color-sage);
        }

        .submit-btn {
            width: 100%;
            padding: 1.25rem;
            font-size: 1rem;
            font-weight: 500;
            font-family: var(--font-sans);
            color: white;
            background: var(--color-dark);
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .submit-btn:hover {
            background: var(--color-accent);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .error-message {
            background: #FFF5F5;
            border-left: 3px solid var(--color-error);
            padding: 1rem;
            margin-bottom: 2rem;
            font-size: 0.875rem;
            color: var(--color-error);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 2rem 0;
            color: #999;
            font-size: 0.875rem;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #E0E0E0;
        }

        .divider::before {
            margin-right: 1rem;
        }

        .divider::after {
            margin-left: 1rem;
        }

        .footer-text {
            text-align: center;
            font-size: 0.875rem;
            color: #666;
            margin-top: 2rem;
        }

        @media (max-width: 968px) {
            .login-container {
                grid-template-columns: 1fr;
            }

            .login-visual {
                display: none;
            }

            .login-form-section {
                padding: 3rem 2rem;
            }
        }

        @media (max-width: 640px) {
            body {
                padding: 1rem;
            }

            .login-form-section {
                padding: 2rem 1.5rem;
            }

            .form-title {
                font-size: 2rem;
            }

            .visual-title {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-visual">
        <div class="logo">MEDICARE PRO</div>
        <div class="visual-content">
            <h1 class="visual-title">Excellence en gestion médicale</h1>
            <p class="visual-subtitle">
                Plateforme de gestion intégrée pour professionnels de santé.
                Sécurisée, intuitive et conforme aux normes RGPD.
            </p>
        </div>
    </div>

    <div class="login-form-section">
        <div class="form-header">
            <h2 class="form-title">Connexion</h2>
            <p class="form-subtitle">Accédez à votre espace professionnel</p>
        </div>

        <%
            String error = request.getParameter("error");
            if (error != null && error.equals("1")) {
        %>
        <div class="error-message">
            Identifiants incorrects. Veuillez réessayer.
        </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <div class="form-group">
                <label for="email" class="form-label">Adresse email</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-input"
                        placeholder="votre.email@exemple.fr"
                        required
                        autocomplete="email"
                >
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Mot de passe</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="••••••••"
                        required
                        autocomplete="current-password"
                >
            </div>

            <div class="form-options">
                <div class="checkbox-group">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Se souvenir de moi</label>
                </div>
                <a href="<%= request.getContextPath() %>/forgot-password" class="forgot-link">
                    Mot de passe oublié ?
                </a>
            </div>

            <button type="submit" class="submit-btn">
                Se connecter
            </button>
        </form>

        <div class="divider">ou</div>

        <p class="footer-text">
            Besoin d'aide ? Contactez le support technique au<br>
            <strong>+33 1 23 45 67 89</strong>
        </p>
    </div>
</div>
</body>
</html>
