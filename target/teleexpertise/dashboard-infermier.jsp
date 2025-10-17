<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Infirmier - TéléExpertise</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        cream: '#FAF8F5',
                        beige: '#F5F1EA',
                        'medical-blue': '#1E3A5F',
                        'medical-blue-light': '#2C5282',
                        'gold': '#D4AF37',
                        'gold-light': '#E8D4A0',
                    }
                }
            }
        }
    </script>
    <style>
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .font-display {
            font-family: 'Playfair Display', serif;
        }
    </style>
</head>
<body class="bg-cream text-gray-800 min-h-screen">
<header class="bg-white border-b border-gray-200 shadow-sm">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-3">
                    <svg class="w-10 h-10 text-medical-blue" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    <span class="text-2xl font-display font-semibold text-medical-blue">MediConnect</span>
                </div>
                <span class="text-sm text-gray-500 border-l border-gray-300 pl-4">Espace Infirmier</span>
            </div>
            <div class="flex items-center gap-4">
                <div class="text-right">
                    <p class="text-sm font-semibold text-medical-blue">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user and not empty sessionScope.user.firstName}">
                                ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                            </c:when>
                            <c:otherwise>
                                Infirmière
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <p class="text-xs text-gray-500">Infirmière</p>
                </div>
                <button class="px-5 py-2.5 text-sm bg-medical-blue hover:bg-medical-blue-light text-white rounded-lg font-medium transition-all shadow-sm hover:shadow">
                    <a href="${pageContext.request.contextPath}/logout">
                        Déconnexion
                    </a>
                </button>
            </div>
        </div>
    </div>
</header>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500 font-medium">Patients en attente</p>
                    <p class="text-4xl font-display font-bold mt-2 text-medical-blue" id="waitingCount">
                        <c:choose>
                            <c:when test="${not empty queueAttent}">${queueAttent.size()}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div class="w-14 h-14 bg-medical-blue/10 rounded-xl flex items-center justify-center">
                    <svg class="w-7 h-7 text-medical-blue" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500 font-medium">Enregistrés aujourd'hui</p>
                    <p class="text-4xl font-display font-bold mt-2 text-medical-blue" id="todayCount">24</p>
                </div>
                <div class="w-14 h-14 bg-emerald-500/10 rounded-xl flex items-center justify-center">
                    <svg class="w-7 h-7 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500 font-medium">Temps moyen d'attente</p>
                    <p class="text-4xl font-display font-bold mt-2 text-medical-blue">18<span
                            class="text-xl text-gray-500">min</span></p>
                </div>
                <div class="w-14 h-14 bg-amber-500/10 rounded-xl flex items-center justify-center">
                    <svg class="w-7 h-7 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="lg:col-span-2 space-y-6">
            <div class="bg-white border border-gray-200 rounded-2xl p-8 shadow-sm">
                <h2 class="text-2xl font-display font-semibold mb-6 flex items-center gap-3 text-medical-blue">
                    <svg class="w-7 h-7 text-gold" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/>
                    </svg>
                    Accueil Patient
                </h2>

                <!-- Enhanced search section with patient display and edit capabilities -->
                <div class="mb-6">
                    <label class="block text-sm font-semibold text-gray-700 mb-3">Rechercher un patient</label>
                    <div class="flex gap-3">
                        <input type="text" id="searchPatient" placeholder="Nom, prénom ou numéro de sécurité sociale..."
                               class="flex-1 bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                        <button onclick="searchPatient()"
                                class="px-8 py-3 bg-medical-blue hover:bg-medical-blue-light text-white rounded-xl font-semibold transition-all shadow-sm hover:shadow">
                            Rechercher
                        </button>
                    </div>
                    <div id="searchResults" class="mt-3 hidden"></div>
                </div>

                <!-- Patient info display section when found -->
                <div id="patientInfoSection"
                     class="hidden mb-6 bg-gradient-to-r from-medical-blue/5 to-gold/5 border border-medical-blue/20 rounded-2xl p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-xl font-display font-semibold text-medical-blue flex items-center gap-2">
                            <svg class="w-6 h-6 text-gold" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                            </svg>
                            Informations du Patient
                        </h3>
                        <div class="flex gap-2">
                            <button onclick="editPatient()"
                                    class="px-4 py-2 bg-medical-blue hover:bg-medical-blue-light text-white rounded-lg font-medium transition-all text-sm shadow-sm">
                                Modifier
                            </button>
                            <button onclick="addToQueue()"
                                    class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg font-medium transition-all text-sm shadow-sm">
                                Ajouter à la file
                            </button>
                            <button onclick="closePatientInfo()"
                                    class="px-3 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-lg transition-all">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div id="patientInfoDisplay" class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                        Patient info will be dynamically inserted here
                    </div>
                </div>

                <div class="border-t border-gray-200 pt-6">
                    <h3 class="text-xl font-display font-semibold mb-6 text-medical-blue" id="formTitle">Nouveau
                        Patient</h3>
                    <form id="patientForm" class="space-y-5" action="${pageContext.request.contextPath}/patient"
                          method="POST">

                        <input type="hidden" id="patientId" value="">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">Nom *</label>
                                <input type="text" id="nom" name="lastName" required
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">Prénom *</label>
                                <input type="text" id="prenom" name="firstName" required
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">Date de naissance
                                    *</label>
                                <input type="date" id="dateNaissance" name="dateNaissance" required
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">N° Sécurité Sociale
                                    *</label>
                                <input type="text" id="numSecu" name="numSS" required
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">
                                    Sexe *
                                </label>
                                <div class="flex items-center gap-6">
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="sexe" value="Homme" required
                                               class="accent-medical-blue w-5 h-5 focus:ring-2 focus:ring-medical-blue">
                                        <span class="text-gray-800">Homme</span>
                                    </label>

                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="sexe" value="Femme" required
                                               class="accent-medical-blue w-5 h-5 focus:ring-2 focus:ring-medical-blue">
                                        <span class="text-gray-800">Femme</span>
                                    </label>
                                </div>
                            </div>

                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">Mutuelle</label>
                                <input type="text" id="mutuelle" name="mutuelle" placeholder="Ex: CNSS, CNOPS, RMA..."
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Adresse complète</label>
                            <input type="text" id="adresse" name="address" placeholder="Rue, ville, code postal..."
                                   class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                        </div>

                        <!-- Enhanced medical data section with description fields -->
                        <div class="border-t border-gray-200 pt-6 mt-6">
                            <h4 class="text-lg font-display font-semibold mb-5 text-medical-blue">Données Médicales</h4>
                            <div class="space-y-5">
                                <div>
                                    <label class="block text-sm font-semibold text-gray-700 mb-2">Antécédents
                                        médicaux</label>
                                    <div class="space-y-3 mb-3">
                                        <input type="text" id="antecedentNom" name="antecedentName"
                                               placeholder="Ex: Diabète type 2, Hypertension..."
                                               class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                        <textarea id="antecedentDesc" name="antecedentDesc"
                                                  placeholder="Description détaillée (date de diagnostic, évolution, etc.)"
                                                  class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all resize-none"></textarea>
                                        <button type="button" onclick="addAntecedent()"
                                                class="w-full px-5 py-2.5 bg-medical-blue hover:bg-medical-blue-light text-white rounded-lg font-medium transition-all shadow-sm flex items-center justify-center gap-2">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M12 4v16m8-8H4"/>
                                            </svg>
                                            Ajouter l'antécédent
                                        </button>
                                    </div>
                                    <div id="antecedentsList" class="space-y-2"></div>
                                </div>

                                <div>
                                    <label class="block text-sm font-semibold text-gray-700 mb-2">Allergies
                                        connues</label>
                                    <div class="space-y-3 mb-3">
                                        <input type="text" id="allergieNom" name="allergieNom"
                                               placeholder="Ex: Pénicilline, Arachides..."
                                               class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                        <textarea id="allergieDesc" name="allergieDesc" rows="2"
                                                  placeholder="Description de la réaction (symptômes, gravité, date de découverte)"
                                                  class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all resize-none"></textarea>
                                        <button type="button" onclick="addAllergie()"
                                                class="w-full px-5 py-2.5 bg-medical-blue hover:bg-medical-blue-light text-white rounded-lg font-medium transition-all shadow-sm flex items-center justify-center gap-2">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M12 4v16m8-8H4"/>
                                            </svg>
                                            Ajouter l'allergie
                                        </button>
                                    </div>
                                    <div id="allergiesList" class="space-y-2"></div>
                                </div>

                                <div>
                                    <label class="block text-sm font-semibold text-gray-700 mb-2">Traitements en
                                        cours</label>
                                    <div class="space-y-3 mb-3">
                                        <input type="text" id="traitementNom" name="traitementNom"
                                               placeholder="Ex: Metformine 500mg..."
                                               class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                        <textarea id="traitementDesc" name="traitementDesc"
                                                  placeholder="Posologie et instructions (2x/jour matin et soir, depuis quand, etc.)"
                                                  class="w-full bg-beige border border-gray-300 rounded-lg px-4 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all resize-none"></textarea>
                                        <button type="button" onclick="addTraitement()"
                                                class="w-full px-5 py-2.5 bg-medical-blue hover:bg-medical-blue-light text-white rounded-lg font-medium transition-all shadow-sm flex items-center justify-center gap-2">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M12 4v16m8-8H4"/>
                                            </svg>
                                            Ajouter le traitement
                                        </button>
                                    </div>
                                    <div id="traitementsList" class="space-y-2"></div>
                                </div>
                            </div>
                        </div>

                        <div class="border-t border-gray-200 pt-6 mt-6">
                            <h4 class="text-lg font-display font-semibold mb-5 text-medical-blue">Signes Vitaux</h4>
                            <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Tension (mmHg)</label>
                                    <input type="text" id="tension" name="tension" placeholder="120/80"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Fréq. Card.
                                        (bpm)</label>
                                    <input type="number" id="freqCard" name="freqCard" placeholder="72"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Température (°C)</label>
                                    <input type="number" id="temperature" name="temperature" step="0.1"
                                           placeholder="37.0"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Fréq. Resp.
                                        (/min)</label>
                                    <input type="number" id="freqResp" name="freqResp" placeholder="16"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Poids (kg)</label>
                                    <input type="number" id="poids" name="poids" step="0.1" placeholder="70.5"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-600 mb-2">Taille (cm)</label>
                                    <input type="number" id="taille" name="taille" placeholder="175"
                                           class="w-full bg-beige border border-gray-300 rounded-lg px-3 py-2.5 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue transition-all">
                                </div>
                            </div>
                        </div>

                        <!-- Section Priorité et Estimation -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                            <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-red-500" fill="none" stroke="currentColor"
                                     viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 15.5c-.77.833.192 2.5 1.732 2.5z"></path>
                                </svg>
                                Priorité et Planning
                            </h3>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Priorité -->
                                <div>
                                    <label for="priority" class="block text-sm font-medium text-gray-700 mb-2">
                                        Niveau de priorité *
                                    </label>
                                    <select id="priority" name="priority" required
                                            class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                                        <option value="">Sélectionner une priorité</option>
                                        <option value="LOW">🟢 Basse - Consultation de routine</option>
                                        <option value="NORMAL">🟡 Normale - Consultation standard</option>
                                        <option value="HIGH">🟠 Haute - Cas préoccupant</option>
                                        <option value="URGENT">🔴 Urgente - Intervention immédiate</option>
                                    </select>
                                </div>

                                <!-- Estimation de temps -->
                                <div>
                                    <label for="estimatedDuration" class="block text-sm font-medium text-gray-700 mb-2">
                                        Durée estimée (minutes)
                                    </label>
                                    <select id="estimatedDuration" name="estimatedDuration"
                                            class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                                        <option value="15">15 minutes - Consultation rapide</option>
                                        <option value="30" selected>30 minutes - Consultation standard</option>
                                        <option value="45">45 minutes - Consultation approfondie</option>
                                        <option value="60">60 minutes - Consultation complexe</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Raison de la priorité -->
                            <div class="mt-4">
                                <label for="priorityReason" class="block text-sm font-medium text-gray-700 mb-2">
                                    Justification de la priorité (optionnel)
                                </label>
                                <textarea id="priorityReason" name="priorityReason" rows="3"
                                          placeholder="Expliquez pourquoi cette priorité est nécessaire..."
                                          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all resize-none"></textarea>
                            </div>

                            <!-- Affichage de l'estimation -->
                            <div id="estimationInfo" class="mt-4 p-4 bg-blue-50 rounded-lg hidden">
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor"
                                         viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    <div>
                                        <p class="text-sm text-blue-800">
                                            <strong>Estimation :</strong>
                                            <span id="queuePosition">Position dans la file : -</span><br>
                                            <span id="waitingTime">Temps d'attente estimé : -</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="flex gap-3 pt-4">
                            <button type="button" onclick="submitPatientForm()"
                                    class="flex-1 px-6 py-3.5 bg-medical-blue hover:bg-medical-blue-light text-white rounded-xl font-semibold transition-all shadow-sm hover:shadow">
                                <span id="submitBtnText">Enregistrer et Ajouter à la file</span>
                            </button>
                            <button type="button" onclick="resetForm()"
                                    class="px-6 py-3.5 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-xl font-semibold transition-all">
                                Annuler
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Section File d'attente -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-lg font-semibold text-gray-800">
                    File d'attente des patients
                    <span class="ml-2 px-2 py-1 bg-blue-100 text-blue-800 text-xs rounded-full">
                        <c:choose>
                            <c:when test="${not empty queueAttent}">${queueAttent.size()}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </span>
                </h3>
                <button onclick="refreshQueue()" class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">
                    Actualiser
                </button>
            </div>

            <!-- Liste des patients -->
            <c:choose>
                <c:when test="${empty queueAttent}">
                    <div class="text-center py-8">
                        <p class="text-gray-500">Aucun patient en attente</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="space-y-4">
                        <c:forEach var="queue" items="${queueAttent}" varStatus="status">
                            <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50"
                                 data-queue-id="${queue.id}">
                                <div class="flex justify-between items-center">
                                    <!-- Informations patient -->
                                    <div class="flex items-center space-x-4">
                                        <div class="w-10 h-10 bg-blue-500 text-white rounded-full flex items-center justify-center font-bold">
                                                ${status.index + 1}
                                        </div>
                                        <div>
                                            <h4 class="font-semibold text-gray-900">
                                                    ${queue.patient.firstName} ${queue.patient.lastName}
                                            </h4>
                                            <div class="text-sm text-gray-600 space-x-4">
                                                <span>N° File: #${queue.queueNumber}</span>
                                                <span class="priority-${queue.priority}">
                                                    Priorité: ${queue.priority.displayName}
                                                </span>
                                                <span>Statut: ${queue.status.displayName}</span>
                                            </div>
                                            <div class="text-xs text-gray-500 mt-1">
                                                Arrivée: <fmt:formatDate value="${queue.createdAt}" pattern="HH:mm"/>
                                                <c:if test="${not empty queue.estimatedTime}">
                                                    | Estimation: <fmt:formatDate value="${queue.estimatedTime}"
                                                                                  pattern="HH:mm"/>
                                                </c:if>
                                            </div>
                                            <c:if test="${not empty queue.notes}">
                                                <p class="text-sm text-gray-600 italic mt-1">${queue.notes}</p>
                                            </c:if>
                                        </div>
                                    </div>

                                    <!-- Actions -->
                                    <div class="flex space-x-2">
                                        <c:choose>
                                            <c:when test="${queue.status == 'WAITING'}">
                                                <button onclick="startConsultation(${queue.id})"
                                                        class="px-3 py-1 bg-green-500 text-white text-sm rounded hover:bg-green-600">
                                                    Commencer
                                                </button>
                                                <button onclick="updatePriority(${queue.id})"
                                                        class="px-3 py-1 bg-yellow-500 text-white text-sm rounded hover:bg-yellow-600">
                                                    Priorité
                                                </button>
                                                <button onclick="cancelConsultation(${queue.id})"
                                                        class="px-3 py-1 bg-red-500 text-white text-sm rounded hover:bg-red-600">
                                                    Annuler
                                                </button>
                                            </c:when>
                                            <c:when test="${queue.status == 'IN_PROGRESS'}">
                                                <button onclick="completeConsultation(${queue.id})"
                                                        class="px-3 py-1 bg-blue-500 text-white text-sm rounded hover:bg-blue-600">
                                                    Terminer
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-gray-400 text-sm">Terminé</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm">
            <h3 class="text-lg font-display font-semibold mb-5 text-medical-blue">Patients du jour</h3>
            <div class="space-y-2 text-sm">
                <div class="flex justify-between py-3 border-b border-gray-200">
                    <span class="text-gray-600 font-medium">Total enregistrés</span>
                    <span class="font-bold text-medical-blue">24</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-200">
                    <span class="text-gray-600 font-medium">En consultation</span>
                    <span class="font-bold text-blue-600">3</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-200">
                    <span class="text-gray-600 font-medium">En attente</span>
                    <span class="font-bold text-amber-600">8</span>
                </div>
                <div class="flex justify-between py-3">
                    <span class="text-gray-600 font-medium">Terminés</span>
                    <span class="font-bold text-emerald-600">13</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Section Patients en attente de transfert -->
<div class="max-w-7xl mx-auto p-6">
    <h2 class="text-2xl font-bold mb-4">Patients en attente de transfert</h2>
    <c:choose>
        <c:when test="${not empty waitingPatients}">
            <table class="min-w-full bg-white border border-gray-200 rounded-lg shadow">
                <thead class="bg-beige">
                <tr>
                    <th class="py-2 px-4 border-b">Nom</th>
                    <th class="py-2 px-4 border-b">Prénom</th>
                    <th class="py-2 px-4 border-b">Priorité</th>
                    <th class="py-2 px-4 border-b">Statut</th>
                    <th class="py-2 px-4 border-b">Date d'entrée</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="q" items="${waitingPatients}">
                    <tr>
                        <td class="py-2 px-4 border-b">${q.medicalRecord.patient.lastName}</td>
                        <td class="py-2 px-4 border-b">${q.medicalRecord.patient.firstName}</td>
                        <td class="py-2 px-4 border-b">${q.priority}</td>
                        <td class="py-2 px-4 border-b">${q.status}</td>
                        <td class="py-2 px-4 border-b"><fmt:formatDate value="${q.createdAt}"
                                                                       pattern="dd/MM/yyyy HH:mm"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p class="text-gray-500">Aucun patient en attente de transfert.</p>
        </c:otherwise>
    </c:choose>
</div>

<script>
    let antecedents = [];
    let allergies = [];
    let traitements = [];
    let currentPatient = null;

    // Mock patient database
    const patientsDB = [];

    function addAntecedent() {
        const nomInput = document.getElementById('antecedentNom');
        const descInput = document.getElementById('antecedentDesc');
        const nom = nomInput.value.trim();
        const description = descInput.value.trim();

        if (nom) {
            antecedents.push({nom, description});
            renderAntecedents();
            nomInput.value = '';
            descInput.value = '';
        }
    }

    function renderAntecedents() {
        const list = document.getElementById('antecedentsList');
        list.innerHTML = antecedents.map((item, index) => `
            <div class="bg-white border border-gray-200 rounded-lg p-4 shadow-sm">
                <div class="flex items-start justify-between mb-2">
                    <div class="flex-1">
                        <p class="font-semibold text-medical-blue">${item.nom}</p>
    ${"${item.description ? `<p class='text-sm text-gray-600 mt-1'>${item.description}</p>` : ''}"}
                    </div>
                    <button type="button" onclick="removeAntecedent(${index})"
                        class="text-red-500 hover:text-red-700 transition-colors ml-3">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>
            </div>
        `).join('');
    }

    function removeAntecedent(index) {
        antecedents.splice(index, 1);
        renderAntecedents();
    }

    function addAllergie() {
        const nomInput = document.getElementById('allergieNom');
        const descInput = document.getElementById('allergieDesc');
        const nom = nomInput.value.trim();
        const description = descInput.value.trim();

        if (nom) {
            allergies.push({nom, description});
            renderAllergies();
            nomInput.value = '';
            descInput.value = '';
        }
    }

    function renderAllergies() {
        const list = document.getElementById('allergiesList');
        list.innerHTML = allergies.map((item, index) => `
            <div class="bg-white border border-red-200 rounded-lg p-4 shadow-sm">
                <div class="flex items-start justify-between mb-2">
                    <div class="flex-1">
                        <div class="flex items-center gap-2 mb-1">
                            <svg class="w-5 h-5 text-red-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                            </svg>
                            <p class="font-semibold text-red-700">${item.nom}</p>
                        </div>
    ${"${item.description ? `<p class='text-sm text-gray-600 mt-1'>${item.description}</p>` : ''}"}
                    </div>
                    <button type="button" onclick="removeAllergie(${index})"
                        class="text-red-500 hover:text-red-700 transition-colors ml-3">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>
            </div>
        `).join('');
    }

    function removeAllergie(index) {
        allergies.splice(index, 1);
        renderAllergies();
    }

    function addTraitement() {
        const nomInput = document.getElementById('traitementNom');
        const descInput = document.getElementById('traitementDesc');
        const nom = nomInput.value.trim();
        const description = descInput.value.trim();

        if (nom) {
            traitements.push({nom, description});
            renderTraitements();
            nomInput.value = '';
            descInput.value = '';
        }
    }

    function renderTraitements() {
        const list = document.getElementById('traitementsList');
        list.innerHTML = traitements.map((item, index) => `
            <div class="bg-white border border-blue-200 rounded-lg p-4 shadow-sm">
                <div class="flex items-start justify-between mb-2">
                    <div class="flex-1">
                        <div class="flex items-center gap-2 mb-1">
                            <svg class="w-5 h-5 text-blue-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                            </svg>
                            <p class="font-semibold text-blue-700">${item.nom}</p>
                        </div>
    ${"${item.description ? `<p class='text-sm text-gray-600 mt-1'>${item.description}</p>` : ''}"}
                    </div>
                    <button type="button" onclick="removeTraitement(${index})"
                        class="text-red-500 hover:text-red-700 transition-colors ml-3">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>
            </div>
        `).join('');
    }

    function removeTraitement(index) {
        traitements.splice(index, 1);
        renderTraitements();
    }

    function searchPatient() {
        const searchTerm = document.getElementById('searchPatient').value.toLowerCase();
        const resultsDiv = document.getElementById('searchResults');

        if (searchTerm.length > 2) {
            const results = patientsDB.filter(p =>
                p.nom.toLowerCase().includes(searchTerm) ||
                p.prenom.toLowerCase().includes(searchTerm) ||
                p.numSecu.includes(searchTerm)
            );

            if (results.length > 0) {
                resultsDiv.classList.remove('hidden');
                resultsDiv.innerHTML = `
                        <div class="bg-beige border border-gray-200 rounded-xl p-4 shadow-sm">
                            <p class="text-sm text-gray-600 font-medium mb-3">Résultats de recherche:</p>
                            <div class="space-y-2">
    <c:forEach var="patient" items="${results}">
        <div onclick="displayPatient(${patient.id})"
             class="p-4 bg-white rounded-lg hover:bg-gray-50 cursor-pointer transition-all border border-gray-200 hover:border-medical-blue">

            <p class="font-semibold text-medical-blue">${patient.prenom} ${patient.nom}</p>
            <p class="text-sm text-gray-500">N° ${patient.numSecu}</p>
            <p class="text-xs text-gray-400 mt-1">Né(e) le: ${patient.dateNaissance}</p>

        </div>
    </c:forEach>
</div>

                        </div>
                    `;
            } else {
                resultsDiv.classList.remove('hidden');
                resultsDiv.innerHTML = `
                        <div class="bg-amber-50 border border-amber-200 rounded-xl p-4">
                            <p class="text-sm text-amber-700">Aucun patient trouvé</p>
                        </div>
                    `;
            }
        } else {
            resultsDiv.classList.add('hidden');
        }
    }

    function displayPatient(patientId) {
        const patient = patientsDB.find(p => p.id === patientId);
        if (!patient) return;

        currentPatient = patient;
        document.getElementById('searchResults').classList.add('hidden');
        document.getElementById('patientInfoSection').classList.remove('hidden');

        const displayDiv = document.getElementById('patientInfoDisplay');
        displayDiv.innerHTML = `
        <!-- Identité -->
        <div class="bg-white rounded-lg p-4 border border-gray-200">
            <p class="text-xs text-gray-500 mb-1">Identité</p>
            <p class="font-semibold text-medical-blue">${patient.prenom} ${patient.nom}</p>
            <p class="text-xs text-gray-400 mt-1">
<c:choose>
    <c:when test="${not empty patient.birthDate}">
        Né(e) le:
        <fmt:formatDate value="${patient.birthDate}" pattern="dd/MM/yyyy" />
    </c:when>
    <c:otherwise>
        Né(e) le: Non renseignée
    </c:otherwise>
</c:choose>
            </p>
        </div>

        <!-- Sécurité Sociale -->
        <div class="bg-white rounded-lg p-4 border border-gray-200">
            <p class="text-xs text-gray-500 mb-1">Sécurité Sociale</p>
            <p class="font-semibold text-gray-800">${patient.numSecu || 'Non renseigné'}</p>
        </div>

        <!-- Contact -->
        <div class="bg-white rounded-lg p-4 border border-gray-200">
            <p class="text-xs text-gray-500 mb-1">Contact</p>
            <p class="text-sm text-gray-800">${patient.telephone || 'Non renseigné'}</p>
        </div>

        <!-- Mutuelle -->
        <div class="bg-white rounded-lg p-4 border border-gray-200">
            <p class="text-xs text-gray-500 mb-1">Mutuelle</p>
            <p class="text-sm text-gray-800">${patient.mutuelle || 'Non renseignée'}</p>
        </div>

        <!-- Adresse -->
        <div class="bg-white rounded-lg p-4 border border-gray-200 md:col-span-2">
            <p class="text-xs text-gray-500 mb-1">Adresse</p>
            <p class="text-sm text-gray-800">${patient.adresse || 'Non renseignée'}</p>
        </div>

        <!-- Antécédents -->
       <c:if test="${not empty patient.antecedents}">
    <div class="bg-white rounded-lg p-4 border border-gray-200 md:col-span-2">
        <p class="text-xs text-gray-500 mb-2">Antécédents</p>
        <div class="space-y-2">
            <c:forEach var="a" items="${patient.antecedents}">
                <div class="text-sm">
                    <p class="font-semibold text-gray-800">${a.nom}</p>
                    <c:if test="${not empty a.description}">
                        <p class="text-gray-600 text-xs">${a.description}</p>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>

        <!-- Allergies -->
        <c:if test="${not empty patient.allergies}">
    <div class="bg-red-50 rounded-lg p-4 border border-red-200 md:col-span-2">
        <p class="text-xs text-red-600 mb-2 font-semibold">⚠️ Allergies</p>
        <div class="space-y-2">
            <c:forEach var="a" items="${patient.allergies}">
                <div class="text-sm">
                    <p class="font-semibold text-red-700">${a.nom}</p>
                    <c:if test="${not empty a.description}">
                        <p class="text-red-600 text-xs">${a.description}</p>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>

        <!-- Traitements en cours -->
       <c:if test="${not empty patient.traitements}">
    <div class="bg-blue-50 rounded-lg p-4 border border-blue-200 md:col-span-2">
        <p class="text-xs text-blue-600 mb-2 font-semibold">Traitements en cours</p>
        <div class="space-y-2">
            <c:forEach var="t" items="${patient.traitements}">
                <div class="text-sm">
                    <p class="font-semibold text-blue-700">${t.nom}</p>
                    <c:if test="${not empty t.description}">
                        <p class="text-blue-600 text-xs">${t.description}</p>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>

        <!-- Signes vitaux -->
       <c:if test="${not empty patient.signesVitaux}">
    <div class="bg-white rounded-lg p-4 border border-gray-200 md:col-span-2">
        <p class="text-xs text-gray-500 mb-2">Derniers signes vitaux</p>
        <div class="grid grid-cols-3 gap-3 text-sm">
            <div>
                <span class="text-gray-600">TA:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.tension}">${patient.signesVitaux.tension}</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <span class="text-gray-600">FC:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.freqCard}">${patient.signesVitaux.freqCard} bpm</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <span class="text-gray-600">T°:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.temperature}">${patient.signesVitaux.temperature}°C</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <span class="text-gray-600">FR:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.freqResp}">${patient.signesVitaux.freqResp}/min</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <span class="text-gray-600">Poids:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.poids}">${patient.signesVitaux.poids} kg</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div>
                <span class="text-gray-600">Taille:</span>
                <span class="font-semibold">
                    <c:choose>
                        <c:when test="${not empty patient.signesVitaux.taille}">${patient.signesVitaux.taille} cm</c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>
    </div>
</c:if>`

    }


    function editPatient() {
        if (!currentPatient) return;

        document.getElementById('formTitle').textContent = 'Modifier Patient';
        document.getElementById('submitBtnText').textContent = 'Mettre à jour';
        document.getElementById('patientId').value = currentPatient.id;

        document.getElementById('nom').value = currentPatient.nom;
        document.getElementById('prenom').value = currentPatient.prenom;
        document.getElementById('dateNaissance').value = currentPatient.dateNaissance;
        document.getElementById('numSecu').value = currentPatient.numSecu;
        document.getElementById('mutuelle').value = currentPatient.mutuelle || '';
        document.getElementById('adresse').value = currentPatient.adresse || '';

        antecedents = [...(currentPatient.antecedents || [])];
        allergies = [...(currentPatient.allergies || [])];
        traitements = [...(currentPatient.traitements || [])];

        renderAntecedents();
        renderAllergies();
        renderTraitements();

        if (currentPatient.signesVitaux) {
            document.getElementById('tension').value = currentPatient.signesVitaux.tension || '';
            document.getElementById('freqCard').value = currentPatient.signesVitaux.freqCard || '';
            document.getElementById('temperature').value = currentPatient.signesVitaux.temperature || '';
            document.getElementById('freqResp').value = currentPatient.signesVitaux.freqResp || '';
            document.getElementById('poids').value = currentPatient.signesVitaux.poids || '';
            document.getElementById('taille').value = currentPatient.signesVitaux.taille || '';
        }

        document.getElementById('patientInfoSection').classList.add('hidden');
        document.getElementById('patientForm').scrollIntoView({behavior: 'smooth'});
    }

    function addToQueue() {
        if (!currentPatient) return;
        alert(currentPatient.prenom + " " + currentPatient.nom + " a été ajouté(e) à la file d'attente avec succès!");
        closePatientInfo();
    }

    function closePatientInfo() {
        document.getElementById('patientInfoSection').classList.add('hidden');
        currentPatient = null;
    }

    function resetForm() {
        document.getElementById('formTitle').textContent = 'Nouveau Patient';
        document.getElementById('submitBtnText').textContent = 'Enregistrer et Ajouter à la file';
        document.getElementById('patientId').value = '';
        currentPatient = null;
        antecedents = [];
        allergies = [];
        traitements = [];
        renderAntecedents();
        renderAllergies();
        renderTraitements();
        document.getElementById('patientForm').reset();
    }

    function submitPatientForm() {
        const event = new Event('submit');
        document.getElementById('patientForm').dispatchEvent(event);
    }

    // Gestionnaire pour le changement de priorité
    document.getElementById('priority').addEventListener('change', function () {
        const priority = this.value;
        const reasonField = document.getElementById('priorityReason');

        if (priority === 'HIGH' || priority === 'URGENT') {
            reasonField.setAttribute('required', 'required');
            reasonField.parentElement.classList.add('border-red-200');
        } else {
            reasonField.removeAttribute('required');
            reasonField.parentElement.classList.remove('border-red-200');
        }
    });

    // Estimation en temps réel
    document.getElementById('estimatedDuration').addEventListener('change', function () {
        updateEstimation();
    });

    document.getElementById('priority').addEventListener('change', function () {
        updateEstimation();
    });

    function updateEstimation() {
        const priority = document.getElementById('priority').value;
        const duration = document.getElementById('estimatedDuration').value;

        if (priority && duration) {
            // Appel AJAX pour obtenir l'estimation en temps réel
            fetch(`http://localhost:8080/teleexpertise/queue/estimate?priority=${priority}&duration=${duration}`)
                .then(response => response.json())
                .then(data => {
                    if (data.position && data.estimatedTime) {
                        showQueueInfo('À déterminer', data.position, data.estimatedTime);
                    }
                })
                .catch(err => console.error('Erreur estimation:', err));
        }
    }

    function showQueueInfo(queueNumber, position, estimatedTime) {
        document.getElementById('queuePosition').textContent = `Position dans la file : ${position}`;
        document.getElementById('waitingTime').textContent = `Temps d'attente estimé : ${estimatedTime}`;
        document.getElementById('estimationInfo').classList.remove('hidden');
    }

    function hideEstimationInfo() {
        document.getElementById('estimationInfo').classList.add('hidden');
    }

    // Gestionnaire de soumission du formulaire
    document.getElementById('patientForm').addEventListener('submit', function (e) {
        e.preventDefault();
        console.log('Form submission intercepted');

        // Récupération de la priorité
        const priorityElement = document.getElementById('priority');
        const selectedPriority = priorityElement.value;

        if (!selectedPriority) {
            alert('Veuillez sélectionner une priorité !');
            priorityElement.focus();
            return;
        }

        const data = {
            id: document.getElementById('patientId').value,
            nom: document.getElementById('nom').value,
            prenom: document.getElementById('prenom').value,
            dateNaissance: document.getElementById('dateNaissance').value,
            numSecu: document.getElementById('numSecu').value,
            mutuelle: document.getElementById('mutuelle').value,
            adresse: document.getElementById('adresse').value,
            sexe: document.querySelector('input[name="sexe"]:checked')?.value,
            antecedents: antecedents,
            allergies: allergies,
            traitements: traitements,
            signesVitaux: {
                tension: document.getElementById('tension').value,
                freqCard: document.getElementById('freqCard').value,
                temperature: document.getElementById('temperature').value,
                freqResp: document.getElementById('freqResp').value,
                poids: document.getElementById('poids').value,
                taille: document.getElementById('taille').value
            },
            priority: selectedPriority,
            estimatedDuration: parseInt(document.getElementById('estimatedDuration').value),
            priorityReason: document.getElementById('priorityReason').value
        };

        console.log('Submitting patient data with priority:', data);

        // Afficher un loader sur le bouton
        const submitBtn = document.getElementById('submitBtnText');
        const originalText = submitBtn.textContent;
        submitBtn.textContent = 'Ajout en cours...';

        fetch("http://localhost:8080/teleexpertise/patient", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(res => {
                console.log('Response status:', res.status);
                return res.ok ? res.json() : Promise.reject(res);
            })
            .then(response => {
                console.log('Success response:', response);

                // Afficher les informations de la file d'attente
                if (response.queueNumber && response.position && response.estimatedTime) {
                    showQueueInfo(response.queueNumber, response.position, response.estimatedTime);
                }

                alert(`Patient enregistré avec succès !\nNuméro de file : ${response.queueNumber || 'N/A'}\nPosition : ${response.position || 'N/A'}`);

                // Reset du formulaire
                resetForm();
                hideEstimationInfo();
            })
            .catch(err => {
                console.error('Error during fetch:', err);
                alert('Erreur lors de l\'enregistrement du patient.');
            })
            .finally(() => {
                // Restaurer le bouton
                submitBtn.textContent = originalText;
            });
    });

    // Fonctions pour la file d'attente
    function refreshQueue() {
        location.reload();
    }

    function startConsultation(queueId) {
        if (confirm('Commencer la consultation pour ce patient ?')) {
            fetch(`http://localhost:8080/teleexpertise/queue/${queueId}/start`, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        refreshQueue();
                    } else {
                        alert('Erreur lors du début de la consultation');
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    alert('Erreur lors du début de la consultation');
                });
        }
    }

    function completeConsultation(queueId) {
        if (confirm('Terminer la consultation pour ce patient ?')) {
            fetch(`http://localhost:8080/teleexpertise/queue/${queueId}/complete`, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        refreshQueue();
                    } else {
                        alert('Erreur lors de la fin de la consultation');
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    alert('Erreur lors de la fin de la consultation');
                });
        }
    }

    function cancelConsultation(queueId) {
        if (confirm('Annuler la consultation pour ce patient ?')) {
            fetch(`http://localhost:8080/teleexpertise/queue/${queueId}/cancel`, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        refreshQueue();
                    } else {
                        alert('Erreur lors de l\'annulation de la consultation');
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    alert('Erreur lors de l\'annulation de la consultation');
                });
        }
    }

    function updatePriority(queueId) {
        const newPriority = prompt('Nouvelle priorité (LOW, NORMAL, HIGH, URGENT):');
        if (newPriority) {
            fetch(`http://localhost:8080/teleexpertise/queue/${queueId}/priority`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({priority: newPriority})
            })
                .then(response => {
                    if (response.ok) {
                        refreshQueue();
                    } else {
                        alert('Erreur lors de la mise à jour de la priorité');
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    alert('Erreur lors de la mise à jour de la priorité');
                });
        }
    }
</script>
</body>
</html>