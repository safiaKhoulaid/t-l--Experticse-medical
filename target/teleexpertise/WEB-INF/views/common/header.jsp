<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<header class="fixed w-full top-0 z-50 bg-white/95 backdrop-blur-sm border-b border-gray-200">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <!-- Logo -->
            <div class="flex items-center">
                <svg class="w-8 h-8 text-medical-blue" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1 11h-4v4h-4v-4H6v-4h4V6h4v4h4v4z"/>
                </svg>
                <span class="ml-2 text-xl font-bold text-medical-dark">MediConnect</span>
            </div>

            <!-- Desktop Navigation -->
            <div class="hidden md:flex items-center space-x-8">
                <a href="index.jsp" class="text-gray-700 hover:text-medical-blue transition-colors">Accueil</a>
                <a href="#video" class="text-gray-700 hover:text-medical-blue transition-colors">Présentation</a>
                <a href="#fonctionnalites" class="text-gray-700 hover:text-medical-blue transition-colors">Fonctionnalités</a>
                <a href="#comment-ca-marche" class="text-gray-700 hover:text-medical-blue transition-colors">Comment ça marche</a>
                <a href="#contact" class="text-gray-700 hover:text-medical-blue transition-colors">Contact</a>
            </div>

            <!-- CTA Buttons -->
            <div class="hidden md:flex items-center space-x-4">
                <c:choose>
                    <c:when test="${not empty sessionScope.userLoggedIn}">
                        <a href="${pageContext.request.contextPath}/logout" >
                            <button class="px-4 py-2 text-medical-blue hover:text-medical-dark transition-colors">
                                Déconnexion
                            </button>
                        </a>
                        <a href="${pageContext.request.contextPath}/dashboard" class="px-3 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 flex items-center">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 8h2v-2H7v2zm0-4h2v-2H7v2zm0-4h2V7H7v2zm4 8h8v-2h-8v2zm0-4h8v-2h-8v2zm0-6v2h8V7h-8z"/>
                            </svg>
                            Dashboard
                        </a>

                    </c:when>
                    <c:otherwise>
                        <a href="login.jsp">
                            <button class="px-4 py-2 text-medical-blue hover:text-medical-dark transition-colors">
                                Connexion
                            </button>
                        </a>
                        <button class="luxury-button px-6 py-2 text-white rounded-lg">
                            S'inscrire
                        </button>
                    </c:otherwise>
                </c:choose>

            </div>

            <!-- Mobile Menu Button -->
            <button id="mobile-menu-btn" class="md:hidden p-2">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
            </button>
        </div>

        <!-- Mobile Menu -->
        <div id="mobile-menu" class="mobile-menu md:hidden">
            <div class="py-4 space-y-4">
                <a href="#accueil" class="block text-gray-700 hover:text-medical-blue">Accueil</a>
                <a href="#video" class="block text-gray-700 hover:text-medical-blue">Présentation</a>
                <a href="#fonctionnalites" class="block text-gray-700 hover:text-medical-blue">Fonctionnalités</a>
                <a href="#comment-ca-marche" class="block text-gray-700 hover:text-medical-blue">Comment ça marche</a>
                <a href="#contact" class="block text-gray-700 hover:text-medical-blue">Contact</a>
                <div class="pt-4 space-y-2">
                    <a href="login.jsp">
                        <button class="w-full px-4 py-2 text-medical-blue border border-medical-blue rounded-lg">
                            Connexion
                        </button>
                    </a>
                    <button class="w-full luxury-button px-4 py-2 text-white rounded-lg">
                        S'inscrire
                    </button>
                </div>
            </div>
        </div>
    </nav>
</header>

<script>
    const header = document.querySelector('header');

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        if (currentScroll > 100) {
            header.style.boxShadow = '0 4px 20px rgba(0,0,0,0.1)';
        } else {
            header.style.boxShadow = 'none';
        }
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

</script>

</body>
</html>
