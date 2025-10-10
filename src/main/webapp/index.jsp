<%--
  Created by IntelliJ IDEA.
  User: ycode
  Date: 10/10/2025
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //response.sendRedirect("home");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediConnect - Télé-expertise Médicale</title>
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

        /* Hero video background */
        .hero-section {
            position: relative;
            height: 100vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(100%) brightness(0.4);
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(180deg, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.6) 100%);
        }

        .hero-content {
            position: relative;
            z-index: 10;
            text-align: center;
            color: white;
            max-width: 800px;
            padding: 0 2rem;
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

        /* Number sections */
        .number-section {
            font-size: 6rem;
            font-weight: 300;
            line-height: 1;
            margin-bottom: 2rem;
        }

        /* Video presentation container */
        .video-presentation {
            position: relative;
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .video-frame {
            position: relative;
            padding-bottom: 56.25%;
            background: #000;
            overflow: hidden;
        }

        .video-frame video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Image sections */
        .large-image {
            width: 100%;
            height: 600px;
            object-fit: cover;
            filter: grayscale(100%);
        }

        /* Smooth scroll */
        html {
            scroll-behavior: smooth;
        }

        /* Fade in animation */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Button hover */
        .btn-primary {
            background: #000;
            color: #fff;
            padding: 1rem 2.5rem;
            border: none;
            font-size: 0.875rem;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-primary:hover {
            background: #333;
            transform: translateY(-2px);
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

        @media (max-width: 768px) {
            .number-section {
                font-size: 4rem;
            }

            .large-image {
                height: 400px;
            }
        }
    </style>
</head>
<body>

Navigation
<nav id="navbar">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <div class="flex justify-between items-center">
            Logo
            <div class="text-xl font-semibold tracking-tight">
                MediConnect
            </div>

            Desktop Menu
            <div class="hidden md:flex items-center space-x-8 text-sm">
                <a href="#accueil" class="hover:opacity-60 transition-opacity">Accueil</a>
                <a href="#presentation" class="hover:opacity-60 transition-opacity">Présentation</a>
                <a href="#processus" class="hover:opacity-60 transition-opacity">Processus</a>
                <a href="#contact" class="hover:opacity-60 transition-opacity">Contact</a>
            </div>

            CTA Button
            <div class="hidden md:block">
                <button class="btn-primary text-xs">
                    Commencer
                </button>
            </div>

            Mobile Menu Button
            <button id="mobile-menu-btn" class="md:hidden">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
            </button>
        </div>
    </div>

    Mobile Menu
    <div id="mobile-menu" class="mobile-menu">
        <div class="flex flex-col space-y-4 text-sm">
            <a href="#accueil" class="hover:opacity-60 transition-opacity">Accueil</a>
            <a href="#presentation" class="hover:opacity-60 transition-opacity">Présentation</a>
            <a href="#processus" class="hover:opacity-60 transition-opacity">Processus</a>
            <a href="#contact" class="hover:opacity-60 transition-opacity">Contact</a>
            <button class="btn-primary text-xs mt-4">
                Commencer
            </button>
        </div>
    </div>
</nav>

Hero Section with Video
<section id="accueil" class="hero-section">
    <video class="hero-video" autoplay muted loop playsinline>
        <source src="/placeholder.mp4" type="video/mp4">
    </video>
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1 class="text-5xl md:text-6xl lg:text-7xl mb-6 leading-tight">
            MediConnect est un système de télé-expertise au service de la coordination médicale dans le domaine de la santé.
        </h1>
    </div>
</section>

Main Objectives Section
<section class="py-32 px-6">
    <div class="max-w-5xl mx-auto">
        <h2 class="text-3xl md:text-4xl mb-16 fade-in">
            Nos enjeux principaux
        </h2>

        <div class="grid md:grid-cols-2 gap-20">
            Objective 1
            <div class="fade-in">
                <div class="number-section">1</div>
                <h3 class="text-xl mb-4">Faciliter la coordination médicale</h3>
                <p class="text-gray-600 leading-relaxed">
                    Accompagner les médecins généralistes dans leur pratique quotidienne en leur donnant accès à l'expertise de spécialistes qualifiés.
                </p>
            </div>

            Objective 2
            <div class="fade-in">
                <div class="number-section">2</div>
                <h3 class="text-xl mb-4">Optimiser le parcours patient</h3>
                <p class="text-gray-600 leading-relaxed">
                    Valoriser la collaboration médicale à travers une plateforme sécurisée, comme le positionnement MediConnect et le modèle de télé-expertise.
                </p>
            </div>
        </div>
    </div>
</section>

Large Image Section
<section class="fade-in">
    <img src="/placeholder.svg?height=600&width=1920"
         alt="Consultation médicale"
         class="large-image">
</section>

Mission Statement
<section class="py-32 px-6">
    <div class="max-w-4xl mx-auto text-center fade-in">
        <h2 class="text-3xl md:text-4xl mb-8 leading-relaxed">
            Allier innovation, qualité et efficacité
        </h2>
        <p class="text-gray-600 text-lg leading-relaxed mb-12">
            MediConnect se veut acteur de la transition numérique dans le domaine de la santé.
            Nous proposons des solutions durables au service des professionnels de santé.
        </p>
        <button class="btn-primary">
            Découvrir notre solution
        </button>
    </div>
</section>

Video Presentation Section
<section id="presentation" class="py-32 px-6 bg-gray-50">
    <div class="max-w-6xl mx-auto">
        <div class="text-center mb-16 fade-in">
            <h2 class="text-3xl md:text-4xl mb-6">
                Présentation vidéo
            </h2>
            <p class="text-gray-600 text-lg">
                Découvrez comment MediConnect transforme la collaboration médicale
            </p>
        </div>

        <div class="video-presentation fade-in">
            <div class="video-frame">
                <video controls poster="/placeholder.svg?height=720&width=1280">
                    <source src="/placeholder.mp4" type="video/mp4">
                    Votre navigateur ne supporte pas la lecture de vidéos.
                </video>
            </div>
        </div>
    </div>
</section>

Global Approach Section
<section id="processus" class="py-32 px-6">
    <div class="max-w-6xl mx-auto">
        <div class="text-center mb-20 fade-in">
            <h2 class="text-3xl md:text-4xl mb-6">
                Une approche globale<br/>pour un modèle d'avenir
            </h2>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            Card 1
            <div class="fade-in">
                <div class="relative overflow-hidden mb-6">
                    <img src="/placeholder.svg?height=400&width=400"
                         alt="Collaboration"
                         class="w-full h-80 object-cover filter grayscale">
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white rounded-full flex items-center justify-center">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                    </div>
                </div>
                <h3 class="text-xl mb-3">Collaboration</h3>
                <p class="text-gray-600 leading-relaxed">
                    Faciliter les échanges entre médecins généralistes et spécialistes pour une meilleure prise en charge.
                </p>
            </div>

            Card 2
            <div class="fade-in">
                <div class="relative overflow-hidden mb-6">
                    <img src="/placeholder.svg?height=400&width=400"
                         alt="Innovation"
                         class="w-full h-80 object-cover filter grayscale">
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white rounded-full flex items-center justify-center">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                    </div>
                </div>
                <h3 class="text-xl mb-3">Innovation</h3>
                <p class="text-gray-600 leading-relaxed">
                    Une plateforme moderne et sécurisée qui répond aux enjeux de la santé numérique.
                </p>
            </div>

            Card 3
            <div class="fade-in">
                <div class="relative overflow-hidden mb-6">
                    <img src="/placeholder.svg?height=400&width=400"
                         alt="Excellence"
                         class="w-full h-80 object-cover filter grayscale">
                    <div class="absolute top-4 right-4 w-10 h-10 bg-white rounded-full flex items-center justify-center">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                    </div>
                </div>
                <h3 class="text-xl mb-3">Excellence</h3>
                <p class="text-gray-600 leading-relaxed">
                    Un réseau de spécialistes qualifiés pour garantir la qualité des avis médicaux.
                </p>
            </div>
        </div>
    </div>
</section>

CTA Section
<section class="py-32 px-6 bg-gray-50">
    <div class="max-w-4xl mx-auto text-center fade-in">
        <h2 class="text-3xl md:text-4xl mb-8">
            Parlons de votre projet
        </h2>
        <button class="btn-primary">
            Nous contacter
        </button>
    </div>
</section>

Footer
<footer id="contact" class="bg-black text-white py-16 px-6">
    <div class="max-w-7xl mx-auto">
        <div class="grid md:grid-cols-4 gap-12 mb-12">
            Company
            <div>
                <h3 class="text-xl font-semibold mb-6">MediConnect</h3>
                <p class="text-gray-400 text-sm leading-relaxed">
                    La plateforme de télé-expertise médicale qui connecte les professionnels de santé.
                </p>
            </div>

            Navigation
            <div>
                <h4 class="text-sm font-semibold mb-4 uppercase tracking-wider">Navigation</h4>
                <ul class="space-y-2 text-sm text-gray-400">
                    <li><a href="#accueil" class="hover:text-white transition-colors">Accueil</a></li>
                    <li><a href="#presentation" class="hover:text-white transition-colors">Présentation</a></li>
                    <li><a href="#processus" class="hover:text-white transition-colors">Processus</a></li>
                    <li><a href="#contact" class="hover:text-white transition-colors">Contact</a></li>
                </ul>
            </div>

            Legal
            <div>
                <h4 class="text-sm font-semibold mb-4 uppercase tracking-wider">Légal</h4>
                <ul class="space-y-2 text-sm text-gray-400">
                    <li><a href="#" class="hover:text-white transition-colors">Mentions légales</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Politique de confidentialité</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">CGU</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">RGPD</a></li>
                </ul>
            </div>

            Contact
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

JavaScript
<script>
    // Mobile menu toggle
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    mobileMenuBtn.addEventListener('click', () => {
        mobileMenu.classList.toggle('active');
    });

    // Close mobile menu on link click
    const mobileLinks = mobileMenu.querySelectorAll('a');
    mobileLinks.forEach(link => {
        link.addEventListener('click', () => {
            mobileMenu.classList.remove('active');
        });
    });

    // Navbar scroll effect
    const navbar = document.getElementById('navbar');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Fade in on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in').forEach(element => {
        observer.observe(element);
    });
</script>
</body>
</html>

