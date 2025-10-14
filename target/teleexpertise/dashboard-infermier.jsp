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
                    <p class="text-4xl font-display font-bold mt-2 text-medical-blue" id="waitingCount">8</p>
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
                    <form id="patientForm" class="space-y-5" >

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
                                <input type="text" id="numSecu" name="numSS"
                                       class="w-full bg-beige border border-gray-300 rounded-xl px-4 py-3 text-gray-800 focus:outline-none focus:ring-2 focus:ring-medical-blue focus:border-transparent transition-all">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">
                                    Sexe *
                                </label>
                                <div class="flex items-center gap-6">
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="sexe" value="Homme"
                                               class="accent-medical-blue w-5 h-5 focus:ring-2 focus:ring-medical-blue">
                                        <span class="text-gray-800">Homme</span>
                                    </label>

                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="sexe" value="Femme"
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

                        <div class="flex gap-3 pt-4">
                            <button type="submit"
                                    class="flex-1 px-6 py-3.5 bg-medical-blue hover:bg-medical-blue-light text-white rounded-xl font-semibold transition-all shadow-sm hover:shadow">
                                <span id="submitBtnText">Enregistrer et Ajouter à la file</span>
                            </button>
                            <button type="reset" onclick="resetForm()"
                                    class="px-6 py-3.5 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-xl font-semibold transition-all">
                                Annuler
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="space-y-6">
            <div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm">
                <h2 class="text-xl font-display font-semibold mb-6 flex items-center justify-between text-medical-blue">
                        <span class="flex items-center gap-2">
                            <svg class="w-6 h-6 text-gold" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            File d'attente
                        </span>
                    <span class="text-sm font-semibold bg-medical-blue/10 text-medical-blue px-3 py-1 rounded-full font-medium">8 patients</span>
                </h2>

                <div class="space-y-3" id="waitingQueue">
                    <div class="bg-beige border border-gray-200 rounded-xl p-4 hover:border-medical-blue/50 hover:shadow-sm transition-all">
                        <div class="flex items-start justify-between mb-2">
                            <div>
                                <p class="font-semibold text-medical-blue">Ahmed Benali</p>
                                <p class="text-sm text-gray-500">N° 2 95 07 75 123 456 78</p>
                            </div>
                            <span class="text-xs bg-amber-100 text-amber-700 px-2.5 py-1 rounded-full font-medium">15 min</span>
                        </div>
                        <div class="text-xs text-gray-600 space-y-1">
                            <p>Arrivée: 09:15</p>
                            <p>TA: 130/85 | FC: 78 bpm | T: 37.2°C</p>
                        </div>
                    </div>

                    <div class="bg-beige border border-gray-200 rounded-xl p-4 hover:border-medical-blue/50 hover:shadow-sm transition-all">
                        <div class="flex items-start justify-between mb-2">
                            <div>
                                <p class="font-semibold text-medical-blue">Sophie Martin</p>
                                <p class="text-sm text-gray-500">N° 1 85 03 45 987 654 32</p>
                            </div>
                            <span class="text-xs bg-emerald-100 text-emerald-700 px-2.5 py-1 rounded-full font-medium">5 min</span>
                        </div>
                        <div class="text-xs text-gray-600 space-y-1">
                            <p>Arrivée: 09:25</p>
                            <p>TA: 120/75 | FC: 72 bpm | T: 36.8°C</p>
                        </div>
                    </div>

                    <div class="bg-beige border border-gray-200 rounded-xl p-4 hover:border-medical-blue/50 hover:shadow-sm transition-all">
                        <div class="flex items-start justify-between mb-2">
                            <div>
                                <p class="font-semibold text-medical-blue">Jean Dupont</p>
                                <p class="text-sm text-gray-500">N° 1 75 12 92 456 789 01</p>
                            </div>
                            <span class="text-xs bg-emerald-100 text-emerald-700 px-2.5 py-1 rounded-full font-medium">2 min</span>
                        </div>
                        <div class="text-xs text-gray-600 space-y-1">
                            <p>Arrivée : 09:28</p>
                            <p>TA: 125/80 | FC: 75 bpm | T: 37.0°C</p>
                        </div>
                    </div>
                </div>
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
</div>

<script>
    let antecedents = [];
    let allergies = [];
    let traitements = [];
    let currentPatient = null;

    // Mock patient database
    const patientsDB = [
        {
            id: 1,
            nom: 'Benali',
            prenom: 'Ahmed',
            dateNaissance: '1975-07-15',
            numSecu: '2 95 07 75 123 456 78',
            telephone: '0612345678',
            mutuelle: 'CNSS',
            adresse: '123 Rue Mohammed V, Casablanca',
            antecedents: [
                {nom: 'Diabète Type 2', description: 'Diagnostiqué en 2018, traité par Metformine'},
                {nom: 'Hypertension', description: 'Depuis 2020, contrôlée par traitement'}
            ],
            allergies: [
                {nom: 'Pénicilline', description: 'Réaction cutanée sévère en 2015'}
            ],
            traitements: [
                {nom: 'Metformine 850mg', description: '2 fois par jour, matin et soir'},
                {nom: 'Amlodipine 5mg', description: '1 fois par jour le matin'}
            ],
            signesVitaux: {
                tension: '130/85',
                freqCard: '78',
                temperature: '37.2',
                freqResp: '16',
                poids: '82.5',
                taille: '175'
            }
        }
    ];

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
                           <c:forEach var="item" items="${antecedents}">
    <div class="bg-white border rounded-lg p-4 shadow-sm">
        <p class="font-semibold text-medical-blue">${item.nom}</p>
        <c:if test="${not empty item.description}">
            <p class="text-sm text-gray-600 mt-1">${item.description}</p>
        </c:if>
    </div>
</c:forEach>

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
<c:if test="${not empty item.description}">
    <p class="text-sm text-gray-600 mt-1">${item.description}</p>
</c:if>
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
<c:if test="${not empty item.description}">
    <p class="text-sm text-gray-600 mt-1">${item.description}</p>
</c:if>
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
    <c:when test="${not empty patient.dateNaissance}">
        Né(e) le:
        <fmt:formatDate value="${patient.dateNaissance}" pattern="dd/MM/yyyy" />
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
        document.getElementById('telephone').value = currentPatient.telephone || '';
        document.getElementById('mutuelle').value = currentPatient.mutuelle || '';
        document.getElementById('adresse').value = currentPatient.adresse || '';

        antecedents = [...currentPatient.antecedents];
        allergies = [...currentPatient.allergies];
        traitements = [...currentPatient.traitements];

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
    }

    document.getElementById('patientForm').addEventListener('submit', function (e) {
        e.preventDefault(); // Stoppe bien le comportement par défaut
        console.log('Form submission intercepted');

        const data = {
            id: document.getElementById('patientId').value,
            nom: document.getElementById('nom').value,
            prenom: document.getElementById('prenom').value,
            dateNaissance: document.getElementById('dateNaissance').value,
            numSecu: document.getElementById('numSecu').value,
            telephone: document.getElementById('telephone') ? document.getElementById('telephone').value : '',
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
            }
        };

        console.log('Submitting patient data:', data);

        // Vérifiez l'URL - pas de "action=" avant le template string
        const url = `${pageContext.request.contextPath}/patient`;
        console.log('Submitting to URL:', url);

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
                alert('Patient enregistré avec succès !');
                this.reset();
                resetForm();
            })
            .catch(err => {
                console.error('Error during fetch:', err);
                alert('Erreur lors de l\'enregistrement du patient.');
            });
    });
    function logout() {
        if (confirm('Êtes-vous sûr de vouloir vous déconnecter?')) {
            window.location.href = 'login.html';
        }


    }


</script>
</body>
</html>