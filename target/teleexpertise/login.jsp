<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - MediConnect</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Libre+Baskerville:wght@400;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: #000;
            background: #fff;
        }

        h1, h2, h3 {
            font-family: 'Libre Baskerville', serif;
            font-weight: 400;
        }

        /* Navigation */
        nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        nav.scrolled {
            background: rgba(255, 255, 255, 0.98);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
        }

        /* Login container */
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 6rem 1.5rem 4rem;
            background: #f9fafb;
        }

        .login-box {
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 0;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            max-width: 480px;
            width: 100%;
            padding: 3rem;
        }

        /* Form elements */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: #374151;
        }

        .form-input {
            width: 100%;
            padding: 0.875rem;
            border: 2px solid #e5e7eb;
            border-radius: 0;
            font-size: 0.875rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #000;
            box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.05);
        }

        .form-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }

        .form-checkbox input {
            width: 16px;
            height: 16px;
            cursor: pointer;
            accent-color: #000;
        }

        /* Button */
        .btn-primary {
            background: #000;
            color: #fff;
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 0;
            font-size: 0.875rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: none;
        }

        .btn-primary:hover {
            background: #333;
            transform: translateY(-2px);
            box-shadow: none;
        }

        .btn-primary:disabled {
            background: #cbd5e1;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        /* Links */
        .link {
            color: #000;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .link:hover {
            color: #666;
            text-decoration: underline;
        }

        /* Mobile menu */
        .mobile-menu {
            display: none;
            position: fixed;
            top: 60px;
            left: 0;
            right: 0;
            background: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .mobile-menu.active {
            display: block;
        }

        /* Fade in animation */
        .fade-in {
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo {
            color: #000;
            font-weight: 600;
            font-size: 1.25rem;
        }

        .nav-link {
            color: #4b5563;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #000;
        }
    </style>
</head>
<body>

<jsp:include page="WEB-INF/views/common/header.jsp" ></jsp:include>

<div class="login-container">

    <div class="login-box fade-in">
        <% if (request.getAttribute("error") != null) { %>
        <div class="text-red-600 text-center mb-4">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
        <div class="text-green-600 text-center mb-4">
            <%= request.getAttribute("success") %>
        </div>
        <% } %>
        <h1 class="text-3xl mb-2 text-center text-gray-900">Connexion</h1>
        <p class="text-center text-gray-600 text-sm mb-8">
            Accédez à votre espace professionnel
        </p>

        <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="form-group">
                <label class="form-label" for="email">Email professionnel</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-input"
                        placeholder="votre.email@exemple.fr"
                        required
                >
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Mot de passe</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="••••••••"
                        required
                >
            </div>

            <div class="form-group">
                <div class="flex justify-between items-center">
                    <label class="form-checkbox">
                        <input type="checkbox" id="remember" name="remember">
                        <span>Se souvenir de moi</span>
                    </label>
                    <a href="#" class="link">Mot de passe oublié ?</a>
                </div>
            </div>

            <button type="submit" class="btn-primary">
                Se connecter
            </button>

            <div class="text-center mt-6">
                <span class="text-sm text-gray-600">Pas encore de compte ? </span>
                <a href="#" class="link">S'inscrire</a>
            </div>
        </form>
    </div>
</div>

<footer id="contact" class="bg-black text-white py-16 px-6">
    <div class="max-w-7xl mx-auto">
        <div class="grid md:grid-cols-4 gap-12 mb-12">
            <div>
                <h3 class="text-xl font-semibold mb-6">MediConnect</h3>
                <p class="text-gray-400 text-sm leading-relaxed">
                    La plateforme de télé-expertise médicale qui connecte les professionnels de santé.
                </p>
            </div>

            <div>
                <h4 class="text-sm font-semibold mb-4 uppercase tracking-wider">Navigation</h4>
                <ul class="space-y-2 text-sm text-gray-400">
                    <li><a href="index.html#accueil" class="hover:text-white transition-colors">Accueil</a></li>
                    <li><a href="index.html#presentation" class="hover:text-white transition-colors">Présentation</a></li>
                    <li><a href="index.html#processus" class="hover:text-white transition-colors">Processus</a></li>
                    <li><a href="index.html#contact" class="hover:text-white transition-colors">Contact</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-sm font-semibold mb-4 uppercase tracking-wider">Légal</h4>
                <ul class="space-y-2 text-sm text-gray-400">
                    <li><a href="#" class="hover:text-white transition-colors">Mentions légales</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Politique de confidentialité</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">CGU</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">RGPD</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-sm font-semibold mb-4 uppercase tracking-wider">Contact</h4>
                <ul class="space-y-2 text-sm text-gray-400">
                    <li>contact@mediconnect.fr</li>
                    <li>+33 1 23 45 67 89</li>
                    <li>Paris, France</li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 text-center text-sm text-gray-400">
            <p>&copy; 2025 MediConnect. Tous droits réservés.</p>
        </div>
    </div>
</footer>

<script>
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    if (mobileMenuBtn && mobileMenu) {
        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('active');
        });
    }

    const loginForm = document.getElementById('login-form');

    if (loginForm) {
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            console.log('[v0] Connexion:', { email, password: '***' });
            alert('Connexion en cours...');
        });
    }

    const navbar = document.getElementById('navbar');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>
</body>
</html>
