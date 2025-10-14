<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediConnect - Système de Télé-expertise Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'medical-blue': '#0066CC',
                        'medical-dark': '#003366',
                        'medical-light': '#E6F2FF',
                        'luxury-gold': '#D4AF37',
                        'luxury-dark': '#1a1a2e',
                    }
                }
            }
        }
    </script>
    <style>
        /* Adding luxury fonts - Playfair Display for headings, Inter for body */
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800&family=Inter:wght@300;400;500;600;700&display=swap');

        * {
            font-family: 'Inter', sans-serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
        }

        /* Enhanced luxury gradient with multiple colors */
        .hero-gradient {
            background: linear-gradient(135deg, #1a1a2e 0%, #003366 50%, #0066CC 100%);
            position: relative;
            overflow: hidden;
        }

        /* Adding animated background particles */
        .hero-gradient::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(212, 175, 55, 0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: particleMove 20s linear infinite;
        }

        @keyframes particleMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(50px, 50px); }
        }

        /* Glassmorphism effect for cards */
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        /* Enhanced hover effects with luxury feel */
        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

        .card-hover::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.1), rgba(0, 102, 204, 0.1));
            opacity: 0;
            transition: opacity 0.4s ease;
            border-radius: inherit;
        }

        .card-hover:hover::before {
            opacity: 1;
        }

        .card-hover:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 102, 204, 0.2);
        }

        /* Luxury fade-in animation */
        .fade-in {
            animation: luxuryFadeIn 1.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes luxuryFadeIn {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Video container with luxury frame */
        .video-container {
            position: relative;
            padding: 20px;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.1), rgba(0, 102, 204, 0.1));
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
        }

        .video-wrapper video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Luxury button with gradient and glow */
        .luxury-button {
            background: linear-gradient(135deg, #0066CC, #003366);
            box-shadow: 0 4px 15px rgba(0, 102, 204, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .luxury-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .luxury-button:hover::before {
            left: 100%;
        }

        .luxury-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 102, 204, 0.6);
        }

        /* Gold accent line */
        .gold-accent {
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #D4AF37, #FFD700);
            margin: 0 auto 1.5rem;
            border-radius: 2px;
        }

        /* Parallax effect */
        .parallax {
            transition: transform 0.3s ease-out;
        }

        .mobile-menu {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .mobile-menu.active {
            max-height: 500px;
        }

        /* Scroll reveal animation */
        .scroll-reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .scroll-reveal.revealed {
            opacity: 1;
            transform: translateY(0);
        }

        /* Luxury number badge */
        .luxury-number {
            background: linear-gradient(135deg, #D4AF37, #FFD700);
            box-shadow: 0 4px 15px rgba(212, 175, 55, 0.4);
        }
    </style>
</head>
<body class="bg-white text-gray-900">

<!-- Header / Navigation -->
<%@ include file="WEB-INF/views/common/header.jsp" %>

<!-- Hero Section -->
<section id="hero" class="pt-32 pb-24 hero-gradient relative">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10" ></div>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10"
    >
        <div class="text-center fade-in">
            <div class="gold-accent"></div>
            <h1 class="text-5xl sm:text-6xl lg:text-7xl font-bold text-white mb-6 leading-tight">
                Télé-expertise Médicale<br/>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-200 to-luxury-gold">d'Excellence</span>
            </h1>
            <p class="text-xl sm:text-2xl text-blue-100 mb-10 max-w-3xl mx-auto leading-relaxed">
                Optimisez le parcours patient en facilitant la coordination entre médecins généralistes
                et spécialistes pour une prise en charge rapide et de qualité supérieure.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <button class="luxury-button px-10 py-5 text-white rounded-xl font-semibold text-lg">
                    Demander un avis médical
                </button>
                <button class="px-10 py-5 bg-white/10 backdrop-blur-sm border-2 border-white text-white rounded-xl font-semibold hover:bg-white/20 transition-all text-lg">
                    En savoir plus
                </button>
            </div>
        </div>
    </div>
    <div class="absolute inset-0 bg-black/20 pointer-events-none"></div>

</section>

<!-- New Video Presentation Section -->
<section id="video" class="py-24 bg-gradient-to-b from-gray-50 to-white">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8" >
        <div class="text-center mb-12 scroll-reveal"  style="background-image: url('${pageContext.request.contextPath}/img/teleexpertise_background.jpg');
                background-size: cover;
                background-position: center;">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Découvrez MediConnect en vidéo
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Une présentation complète de notre système de télé-expertise médicale
            </p>
        </div>

        <div class="video-container scroll-reveal">
            <div class="video-wrapper">
                <video
                        controls
                        poster="/placeholder.svg?height=720&width=1280"
                        class="w-full h-full"
                >
                    <source src="/placeholder.mp4" type="video/mp4">
                    Votre navigateur ne supporte pas la lecture de vidéos.
                </video>
            </div>
        </div>

        <div class="mt-12 grid md:grid-cols-3 gap-6 scroll-reveal">
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">2 min</div>
                <p class="text-gray-600">Temps moyen de création d'une demande</p>
            </div>
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">24h</div>
                <p class="text-gray-600">Délai moyen de réponse des spécialistes</p>
            </div>
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">98%</div>
                <p class="text-gray-600">Taux de satisfaction des médecins</p>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section id="fonctionnalites" class="py-24 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16 scroll-reveal">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Fonctionnalités d'Excellence
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Une plateforme complète pour faciliter la collaboration médicale à distance
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Demandes simplifiées
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Créez et envoyez des demandes d'avis médical en quelques clics avec tous les documents nécessaires.
                </p>
            </div>

            <!-- Feature 2 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Réponses rapides
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Les spécialistes reçoivent les demandes instantanément et peuvent répondre rapidement.
                </p>
            </div>

            <!-- Feature 3 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Sécurité garantie
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Toutes les données médicales sont cryptées et conformes aux normes RGPD et HDS.
                </p>
            </div>

            <!-- Feature 4 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Réseau de spécialistes
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Accédez à un large réseau de médecins spécialistes qualifiés dans toutes les disciplines.
                </p>
            </div>

            <!-- Feature 5 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Suivi des dossiers
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Suivez l'évolution de vos demandes en temps réel avec un tableau de bord intuitif.
                </p>
            </div>

            <!-- Feature 6 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Communication directe
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Échangez directement avec les spécialistes via une messagerie sécurisée intégrée.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section id="comment-ca-marche" class="py-24 bg-gradient-to-b from-gray-50 to-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16 scroll-reveal">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Comment ça marche ?
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Un processus simple en 4 étapes pour une collaboration efficace
            </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- Step 1 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    1
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Créer une demande
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Le médecin généraliste crée une demande d'avis avec les informations du patient
                </p>
            </div>

            <!-- Step 2 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    2
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Sélectionner un spécialiste
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Choisissez le spécialiste approprié selon la spécialité requise
                </p>
            </div>

            <!-- Step 3 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    3
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Recevoir l'avis
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Le spécialiste analyse le dossier et fournit son expertise médicale
                </p>
            </div>

            <!-- Step 4 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    4
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Traiter le patient
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Appliquez les recommandations pour une prise en charge optimale
                </p>
            </div>
        </div>
    </div>
</section>

<!-- User Types Section -->
<section class="py-24 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-2 gap-12">
            <!-- For General Practitioners -->
            <div class="glass-card p-12 rounded-3xl shadow-2xl scroll-reveal">
                <div class="w-20 h-20 bg-gradient-to-br from-medical-blue to-medical-dark rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <h3 class="text-3xl font-bold text-gray-900 mb-4">
                    Pour les Médecins Généralistes
                </h3>
                <p class="text-gray-600 mb-6 leading-relaxed text-lg">
                    Obtenez rapidement l'avis d'un spécialiste pour vos patients sans délai d'attente.
                    Améliorez la qualité de vos diagnostics et traitements.
                </p>
                <ul class="space-y-4 mb-8">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Accès à tous les spécialistes</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Réponses sous 24h maximum</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Historique complet des consultations</span>
                    </li>
                </ul>
                <button class="luxury-button w-full px-6 py-4 text-white rounded-xl font-semibold text-lg">
                    Commencer maintenant
                </button>
            </div>

            <!-- For Specialists -->
            <div class="glass-card p-12 rounded-3xl shadow-2xl scroll-reveal">
                <div class="w-20 h-20 bg-gradient-to-br from-medical-blue to-medical-dark rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                </div>
                <h3 class="text-3xl font-bold text-gray-900 mb-4">
                    Pour les Médecins Spécialistes
                </h3>
                <p class="text-gray-600 mb-6 leading-relaxed text-lg">
                    Partagez votre expertise et contribuez à améliorer la prise en charge des patients.
                    Gérez vos consultations à distance de manière flexible.
                </p>
                <ul class="space-y-4 mb-8">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Consultations à votre rythme</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Rémunération attractive</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Interface simple et efficace</span>
                    </li>
                </ul>
                <button class="luxury-button w-full px-6 py-4 text-white rounded-xl font-semibold text-lg">
                    Rejoindre le réseau
                </button>
            </div>
        </div>
    </div>
</section>



<section class="py-24 hero-gradient relative">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
        <div class="gold-accent"></div>
        <h2 class="text-4xl sm:text-5xl font-bold text-white mb-6">
            Prêt à améliorer la prise en charge de vos patients ?
        </h2>
        <p class="text-xl text-blue-100 mb-10">
            Rejoignez des centaines de médecins qui utilisent déjà MediConnect
        </p>
        <button class="luxury-button px-10 py-5 bg-white text-medical-blue rounded-xl font-semibold text-lg">
            Créer un compte gratuitement
        </button>
    </div>
</section>

<!--include footer -->

<jsp:include page="WEB-INF/views/common/footer.jsp" />

<!-- JavaScript -->
<script>
    // Mobile menu toggle
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    mobileMenuBtn.addEventListener('click', () => {
        mobileMenu.classList.toggle('active');
    });

    // Close mobile menu when clicking on a link
    const mobileLinks = mobileMenu.querySelectorAll('a');
    mobileLinks.forEach(link => {
        link.addEventListener('click', () => {
            mobileMenu.classList.remove('active');
        });
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerOffset = 80;
                const elementPosition = target.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });



    const scrollRevealObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.classList.add('revealed');
                }, index * 100);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    document.querySelectorAll('.scroll-reveal').forEach(element => {
        scrollRevealObserver.observe(element);
    });

    const heroSection = document.querySelector('.hero-gradient');

    document.addEventListener('mousemove', (e) => {
        const mouseX = e.clientX / window.innerWidth;
        const mouseY = e.clientY / window.innerHeight;

        const parallaxElements = document.querySelectorAll('.parallax');
        parallaxElements.forEach(element => {
            const speed = element.dataset.speed || 2;
            const x = (window.innerWidth - mouseX * speed) / 100;
            const y = (window.innerHeight - mouseY * speed) / 100;

            element.style.transform = `translateX(${x}px) translateY(${y}px)`;
        });
    });
</script>
</body>
</html>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediConnect - Système de Télé-expertise Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'medical-blue': '#0066CC',
                        'medical-dark': '#003366',
                        'medical-light': '#E6F2FF',
                        'luxury-gold': '#D4AF37',
                        'luxury-dark': '#1a1a2e',
                    }
                }
            }
        }
    </script>
    <style>
        /* Adding luxury fonts - Playfair Display for headings, Inter for body */
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800&family=Inter:wght@300;400;500;600;700&display=swap');

        * {
            font-family: 'Inter', sans-serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
        }

        /* Enhanced luxury gradient with multiple colors */
        .hero-gradient {
            background: linear-gradient(135deg, #1a1a2e 0%, #003366 50%, #0066CC 100%);
            position: relative;
            overflow: hidden;
        }

        /* Adding animated background particles */
        .hero-gradient::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(212, 175, 55, 0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: particleMove 20s linear infinite;
        }

        @keyframes particleMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(50px, 50px); }
        }

        /* Glassmorphism effect for cards */
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        /* Enhanced hover effects with luxury feel */
        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
        }

        .card-hover::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.1), rgba(0, 102, 204, 0.1));
            opacity: 0;
            transition: opacity 0.4s ease;
            border-radius: inherit;
        }

        .card-hover:hover::before {
            opacity: 1;
        }

        .card-hover:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 102, 204, 0.2);
        }

        /* Luxury fade-in animation */
        .fade-in {
            animation: luxuryFadeIn 1.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes luxuryFadeIn {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Video container with luxury frame */
        .video-container {
            position: relative;
            padding: 20px;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.1), rgba(0, 102, 204, 0.1));
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
        }

        .video-wrapper video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Luxury button with gradient and glow */
        .luxury-button {
            background: linear-gradient(135deg, #0066CC, #003366);
            box-shadow: 0 4px 15px rgba(0, 102, 204, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .luxury-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .luxury-button:hover::before {
            left: 100%;
        }

        .luxury-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 102, 204, 0.6);
        }

        /* Gold accent line */
        .gold-accent {
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #D4AF37, #FFD700);
            margin: 0 auto 1.5rem;
            border-radius: 2px;
        }

        /* Parallax effect */
        .parallax {
            transition: transform 0.3s ease-out;
        }

        .mobile-menu {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .mobile-menu.active {
            max-height: 500px;
        }

        /* Scroll reveal animation */
        .scroll-reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .scroll-reveal.revealed {
            opacity: 1;
            transform: translateY(0);
        }

        /* Luxury number badge */
        .luxury-number {
            background: linear-gradient(135deg, #D4AF37, #FFD700);
            box-shadow: 0 4px 15px rgba(212, 175, 55, 0.4);
        }
    </style>
</head>
<body class="bg-white text-gray-900">

<!-- Hero Section -->
<section id="accueil" class="pt-32 pb-24 hero-gradient relative">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div class="text-center fade-in">
            <div class="gold-accent"></div>
            <h1 class="text-5xl sm:text-6xl lg:text-7xl font-bold text-white mb-6 leading-tight">
                Télé-expertise Médicale<br/>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-200 to-luxury-gold">d'Excellence</span>
            </h1>
            <p class="text-xl sm:text-2xl text-blue-100 mb-10 max-w-3xl mx-auto leading-relaxed">
                Optimisez le parcours patient en facilitant la coordination entre médecins généralistes
                et spécialistes pour une prise en charge rapide et de qualité supérieure.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <button class="luxury-button px-10 py-5 text-white rounded-xl font-semibold text-lg">
                    Demander un avis médical
                </button>
                <button class="px-10 py-5 bg-white/10 backdrop-blur-sm border-2 border-white text-white rounded-xl font-semibold hover:bg-white/20 transition-all text-lg">
                    En savoir plus
                </button>
            </div>
        </div>
    </div>
</section>

<!-- New Video Presentation Section -->
<section id="video" class="py-24 bg-gradient-to-b from-gray-50 to-white">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12 scroll-reveal">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Découvrez MediConnect en vidéo
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Une présentation complète de notre système de télé-expertise médicale
            </p>
        </div>

        <div class="video-container scroll-reveal">
            <div class="video-wrapper">
                <video
                        controls
                        poster="/placeholder.svg?height=720&width=1280"
                        class="w-full h-full"
                >
                    <source src="/placeholder.mp4" >
                    Votre navigateur ne supporte pas la lecture de vidéos.
                </video>
            </div>
        </div>

        <div class="mt-12 grid md:grid-cols-3 gap-6 scroll-reveal">
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">2 min</div>
                <p class="text-gray-600">Temps moyen de création d'une demande</p>
            </div>
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">24h</div>
                <p class="text-gray-600">Délai moyen de réponse des spécialistes</p>
            </div>
            <div class="text-center p-6 glass-card rounded-xl">
                <div class="text-4xl font-bold text-medical-blue mb-2">98%</div>
                <p class="text-gray-600">Taux de satisfaction des médecins</p>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section id="fonctionnalites" class="py-24 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16 scroll-reveal">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Fonctionnalités d'Excellence
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Une plateforme complète pour faciliter la collaboration médicale à distance
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Demandes simplifiées
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Créez et envoyez des demandes d'avis médical en quelques clics avec tous les documents nécessaires.
                </p>
            </div>

            <!-- Feature 2 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Réponses rapides
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Les spécialistes reçoivent les demandes instantanément et peuvent répondre rapidement.
                </p>
            </div>

            <!-- Feature 3 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Sécurité garantie
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Toutes les données médicales sont cryptées et conformes aux normes RGPD et HDS.
                </p>
            </div>

            <!-- Feature 4 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Réseau de spécialistes
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Accédez à un large réseau de médecins spécialistes qualifiés dans toutes les disciplines.
                </p>
            </div>

            <!-- Feature 5 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Suivi des dossiers
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Suivez l'évolution de vos demandes en temps réel avec un tableau de bord intuitif.
                </p>
            </div>

            <!-- Feature 6 -->
            <div class="glass-card p-10 rounded-2xl card-hover scroll-reveal">
                <div class="w-16 h-16 bg-gradient-to-br from-medical-blue to-medical-dark rounded-xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"/>
                    </svg>
                </div>
                <h3 class="text-2xl font-semibold text-gray-900 mb-3">
                    Communication directe
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Échangez directement avec les spécialistes via une messagerie sécurisée intégrée.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section id="comment-ca-marche" class="py-24 bg-gradient-to-b from-gray-50 to-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16 scroll-reveal">
            <div class="gold-accent"></div>
            <h2 class="text-4xl sm:text-5xl font-bold text-gray-900 mb-4">
                Comment ça marche ?
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Un processus simple en 4 étapes pour une collaboration efficace
            </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- Step 1 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    1
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Créer une demande
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Le médecin généraliste crée une demande d'avis avec les informations du patient
                </p>
            </div>

            <!-- Step 2 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    2
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Sélectionner un spécialiste
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Choisissez le spécialiste approprié selon la spécialité requise
                </p>
            </div>

            <!-- Step 3 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    3
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Recevoir l'avis
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Le spécialiste analyse le dossier et fournit son expertise médicale
                </p>
            </div>

            <!-- Step 4 -->
            <div class="text-center scroll-reveal">
                <div class="luxury-number w-20 h-20 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">
                    4
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">
                    Traiter le patient
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Appliquez les recommandations pour une prise en charge optimale
                </p>
            </div>
        </div>
    </div>
</section>

<!-- User Types Section -->
<section class="py-24 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-2 gap-12">
            <!-- For General Practitioners -->
            <div class="glass-card p-12 rounded-3xl shadow-2xl scroll-reveal">
                <div class="w-20 h-20 bg-gradient-to-br from-medical-blue to-medical-dark rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <h3 class="text-3xl font-bold text-gray-900 mb-4">
                    Pour les Médecins Généralistes
                </h3>
                <p class="text-gray-600 mb-6 leading-relaxed text-lg">
                    Obtenez rapidement l'avis d'un spécialiste pour vos patients sans délai d'attente.
                    Améliorez la qualité de vos diagnostics et traitements.
                </p>
                <ul class="space-y-4 mb-8">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Accès à tous les spécialistes</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Réponses sous 24h maximum</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Historique complet des consultations</span>
                    </li>
                </ul>
                <button class="luxury-button w-full px-6 py-4 text-white rounded-xl font-semibold text-lg">
                    Commencer maintenant
                </button>
            </div>

            <!-- For Specialists -->
            <div class="glass-card p-12 rounded-3xl shadow-2xl scroll-reveal">
                <div class="w-20 h-20 bg-gradient-to-br from-medical-blue to-medical-dark rounded-2xl flex items-center justify-center mb-6 shadow-lg">
                    <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                </div>
                <h3 class="text-3xl font-bold text-gray-900 mb-4">
                    Pour les Médecins Spécialistes
                </h3>
                <p class="text-gray-600 mb-6 leading-relaxed text-lg">
                    Partagez votre expertise et contribuez à améliorer la prise en charge des patients.
                    Gérez vos consultations à distance de manière flexible.
                </p>
                <ul class="space-y-4 mb-8">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Consultations à votre rythme</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Rémunération attractive</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-luxury-gold mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-gray-700 text-lg">Interface simple et efficace</span>
                    </li>
                </ul>
                <button class="luxury-button w-full px-6 py-4 text-white rounded-xl font-semibold text-lg">
                    Rejoindre le réseau
                </button>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-24 hero-gradient relative">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
        <div class="gold-accent"></div>
        <h2 class="text-4xl sm:text-5xl font-bold text-white mb-6">
            Prêt à améliorer la prise en charge de vos patients ?
        </h2>
        <p class="text-xl text-blue-100 mb-10">
            Rejoignez des centaines de médecins qui utilisent déjà MediConnect
        </p>
        <button class="luxury-button px-10 py-5 bg-white text-medical-blue rounded-xl font-semibold text-lg">
            Créer un compte gratuitement
        </button>
    </div>
</section>

<!-- Footer -->
<footer id="contact" class="bg-luxury-dark text-gray-300 py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-4 gap-8 mb-12">
            <!-- Company Info -->
            <div>
                <div class="flex items-center mb-4">
                    <svg class="w-8 h-8 text-luxury-gold" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1 11h-4v4h-4v-4H6v-4h4V6h4v4h4v4z"/>
                    </svg>
                    <span class="ml-2 text-xl font-bold text-white">MediConnect</span>
                </div>
                <p class="text-sm leading-relaxed">
                    La plateforme de télé-expertise médicale qui connecte médecins généralistes et spécialistes.
                </p>
            </div>

            <!-- Quick Links -->
            <div>
                <h4 class="text-white font-semibold mb-4">Liens rapides</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="#accueil" class="hover:text-luxury-gold transition-colors">Accueil</a></li>
                    <li><a href="#video" class="hover:text-luxury-gold transition-colors">Présentation</a></li>
                    <li><a href="#fonctionnalites" class="hover:text-luxury-gold transition-colors">Fonctionnalités</a></li>
                    <li><a href="#comment-ca-marche" class="hover:text-luxury-gold transition-colors">Comment ça marche</a></li>
                </ul>
            </div>

            <!-- Legal -->
            <div>
                <h4 class="text-white font-semibold mb-4">Légal</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="#" class="hover:text-luxury-gold transition-colors">Mentions légales</a></li>
                    <li><a href="#" class="hover:text-luxury-gold transition-colors">Politique de confidentialité</a></li>
                    <li><a href="#" class="hover:text-luxury-gold transition-colors">CGU</a></li>
                    <li><a href="#" class="hover:text-luxury-gold transition-colors">RGPD</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div>
                <h4 class="text-white font-semibold mb-4">Contact</h4>
                <ul class="space-y-2 text-sm">
                    <li>Email: contact@mediconnect.fr</li>
                    <li>Tél: +33 1 23 45 67 89</li>
                    <li>Support: support@mediconnect.fr</li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 text-center text-sm">
            <p>&copy; 2025 MediConnect. Tous droits réservés. Système conforme RGPD et HDS.</p>
        </div>
    </div>
</footer>

<!-- JavaScript -->
<script>

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerOffset = 80;
                const elementPosition = target.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });



    const scrollRevealObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.classList.add('revealed');
                }, index * 100);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    document.querySelectorAll('.scroll-reveal').forEach(element => {
        scrollRevealObserver.observe(element);
    });

    const heroSection = document.querySelector('.hero-gradient');

    document.addEventListener('mousemove', (e) => {
        const mouseX = e.clientX / window.innerWidth;
        const mouseY = e.clientY / window.innerHeight;

        const parallaxElements = document.querySelectorAll('.parallax');
        parallaxElements.forEach(element => {
            const speed = element.dataset.speed || 2;
            const x = (window.innerWidth - mouseX * speed) / 100;
            const y = (window.innerHeight - mouseY * speed) / 100;

            element.style.transform = `translateX(${x}px) translateY(${y}px)`;
        });
    });
</script>
</body>
</html>
