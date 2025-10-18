<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Médecin Généraliste - TéléExpertise</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Nouvelle palette de couleurs ultra lumineuse et moderne -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'sky': '#E0F2FE',
                        'mint': '#D1FAE5',
                        'lavender': '#EDE9FE',
                        'peach': '#FED7AA',
                        'rose': '#FCE7F3',
                        'ocean': '#06B6D4',
                        'lime': '#84CC16',
                        'violet': '#8B5CF6',
                        'coral': '#FB923C',
                        'pink': '#EC4899',
                    },
                    fontFamily: {
                        sans: ['Poppins', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <!-- Style moderne avec typographie Poppins -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #E0F2FE 0%, #FCE7F3 100%);
        }
    </style>
</head>
<body class="min-h-screen">
<!-- Header ultra moderne avec fond blanc et accents colorés -->
<header class="bg-white shadow-sm border-b-4 border-ocean">
    <div class="max-w-7xl mx-auto px-6 lg:px-8">
        <div class="flex justify-between items-center h-24">
            <div class="flex items-center gap-8">
                <div class="flex items-center gap-4">
                    <div class="w-14 h-14 bg-gradient-to-br from-ocean to-violet rounded-2xl flex items-center justify-center shadow-lg">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                    </div>
                    <div>
                        <h1 class="text-3xl font-bold bg-gradient-to-r from-ocean to-violet bg-clip-text text-transparent">TéléExpertise</h1>
                        <p class="text-sm text-gray-500 font-medium">Médecin Généraliste</p>
                    </div>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <div class="text-right">
                    <p class="text-sm text-gray-500">Bienvenue,</p>
                    <!-- Fixed JSP syntax error with proper EL expression -->
                    <c:if test="${not empty sessionScope.user}">
                        <p class="text-lg font-bold text-gray-800">${sessionScope.user.lastName} ${sessionScope.user.firstName}</p>
                    </c:if>
                    <p class="text-sm text-gray-500">Médecin Généraliste</p>
                </div>
                <!-- Fixed button structure and link formatting -->
                <a href="${pageContext.request.contextPath}/logout" class="px-6 py-3 bg-gradient-to-r from-coral to-pink text-white rounded-xl font-semibold hover:shadow-lg transition-all duration-300 transform hover:scale-105 inline-block">
                    Déconnexion
                </a>
            </div>
        </div>
    </div>
</header>

<div class="max-w-7xl mx-auto px-6 lg:px-8 py-12">
    <!-- File: src/main/webapp/dashboard-medecin.jsp -->
    <!-- Ajouter juste après le header ou au début du container principal -->
    <c:if test="${not empty sucessMessage or not empty errorMessage}">
        <div id="flashMessage"
             class="max-w-7xl mx-auto px-6 lg:px-8 mt-6"
             style="position:relative; z-index:60;">
            <c:choose>
                <c:when test="${successMessage != null}">
                    <div class="bg-green-50 border-l-4 border-green-400 text-green-800 p-4 rounded-lg shadow-md">
                        <p class="font-semibold">Succès</p>
                        <p>${successMessage}</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="bg-red-50 border-l-4 border-red-400 text-red-800 p-4 rounded-lg shadow-md">
                        <p class="font-semibold">Erreur</p>
                        <p>${errorMessage}</p>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- supprimer le message de la session après affichage -->
            <c:remove var="flashMessage" scope="session" />
            <c:remove var="flashType" scope="session" />
        </div>

        <script>
            // Masquer automatiquement après 5s
            setTimeout(function() {
                const el = document.getElementById('flashMessage');
                if (el) { el.style.transition = 'opacity 400ms'; el.style.opacity = '0'; setTimeout(()=>el.remove(), 450); }
            }, 5000);
        </script>
    </c:if>

    <!-- Cartes statistiques avec couleurs pastel vives et design moderne -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-12">
        <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 border-4 border-sky">
            <div class="flex items-center justify-between mb-4">
                <div class="w-16 h-16 bg-sky rounded-2xl flex items-center justify-center">
                    <svg class="w-9 h-9 text-ocean" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-600 font-semibold mb-2">Patients en attente</p>
            <p class="text-5xl font-bold text-ocean">8</p>
        </div>

        <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 border-4 border-lavender">
            <div class="flex items-center justify-between mb-4">
                <div class="w-16 h-16 bg-lavender rounded-2xl flex items-center justify-center">
                    <svg class="w-9 h-9 text-violet" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-600 font-semibold mb-2">Consultations du jour</p>
            <p class="text-5xl font-bold text-violet">15</p>
        </div>

        <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 border-4 border-peach">
            <div class="flex items-center justify-between mb-4">
                <div class="w-16 h-16 bg-peach rounded-2xl flex items-center justify-center">
                    <svg class="w-9 h-9 text-coral" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-600 font-semibold mb-2">Expertises demandées</p>
            <p class="text-5xl font-bold text-coral">3</p>
        </div>

        <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 border-4 border-mint">
            <div class="flex items-center justify-between mb-4">
                <div class="w-16 h-16 bg-mint rounded-2xl flex items-center justify-center">
                    <svg class="w-9 h-9 text-lime" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
            <p class="text-sm text-gray-600 font-semibold mb-2">Revenu du jour</p>
            <p class="text-5xl font-bold text-lime">2,850<span class="text-2xl">DH</span></p>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div class="lg:col-span-2 space-y-8">
            <!-- Section patients avec design ultra moderne et coloré -->
            <div class="bg-white rounded-3xl p-10 shadow-xl border-4 border-sky overflow-y-auto max-h-[600px]">
                <h2 class="text-3xl font-bold mb-8 flex items-center gap-4 text-gray-800">
                    <div class="w-12 h-12 bg-gradient-to-br from-ocean to-violet rounded-xl flex items-center justify-center">
                        <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857
                         M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857
                         m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0z
                         M7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                        </svg>
                    </div>
                    File d'attente des patients
                </h2>

                <div class="space-y-6">
                    <c:if test="${not empty queuesList}">
                        <p class="text-sm text-gray-500 font-medium mb-4">Patients en attente de consultation</p>
                        <c:forEach var="queue" items="${queuesList}">
                            <div class="bg-gradient-to-br from-lavender to-white rounded-2xl p-8 shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:scale-[1.02] border-l-8 border-violet">
                                <div class="flex items-start justify-between mb-6">
                                    <div class="flex-1">
                                        <p class="font-bold text-2xl text-gray-800 mb-2">
                                                ${queue.medicalRecord.patient.firstName} ${queue.medicalRecord.patient.lastName}
                                        </p>
                                        <p class="text-sm text-gray-600 font-medium">${queue.medicalRecord.patient.numeroSs}</p>
                                        <p class="text-sm text-gray-600 font-medium">Née le: ${queue.medicalRecord.patient.birthDate}</p>
                                    </div>
                                    <!-- Fixed variable expression syntax -->
                                    <span class="text-sm bg-lime text-white px-5 py-2 rounded-full font-bold shadow-md">⏱ ${queue.createdAt}</span>
                                </div>

                                <div class="grid grid-cols-2 gap-8 mb-6">
                                    <div class="bg-white rounded-xl p-5 shadow-sm">
                                        <p class="text-xs text-gray-500 font-bold mb-3 uppercase tracking-wide">Signes vitaux</p>
                                        <c:if test="${not empty queue.medicalRecord.latestVitalSign}">
                                            <!-- Removed redundant div and fixed structure -->
                                            <c:set var="vs" value="${queue.medicalRecord.latestVitalSign}"/>
                                            <div class="space-y-2 text-sm text-gray-700 font-medium">
                                                <p>💓 ${vs.bloodPressureDiastolic}</p>
                                                <p>🌡️ ${vs.temperature}</p>
                                                <p>🫁 FR: ${vs.respiratoryRate}</p>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="bg-white rounded-xl p-5 shadow-sm">
                                        <p class="text-xs text-gray-500 font-bold mb-3 uppercase tracking-wide">Informations</p>
                                        <div class="space-y-2 text-sm text-gray-700 font-medium">
                                            <p>🕐 Arrivée: 09:25</p>
                                            <p>⚖️ Poids: 65 kg</p>
                                            <p>📏 Taille: 168 cm</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-6">
                                    <p class="text-xs text-gray-500 font-bold mb-3 uppercase tracking-wide">Allergies connues</p>
                                    <div class="flex flex-wrap gap-3">
                                        <c:forEach var="allergy" items="${queue.medicalRecord.allergies}">
                                            <span class="text-sm bg-pink text-white px-4 py-2 rounded-full font-bold shadow-md">⚠️ ${allergy.allergyName}</span>
                                        </c:forEach>
                                        <c:if test="${empty queue.medicalRecord.allergies}">
                                            <span class="text-sm bg-gray-200 text-gray-600 px-4 py-2 rounded-full font-bold">✓ Aucune allergie connue</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="mb-6">
                                    <p class="text-xs text-gray-500 font-bold mb-3 uppercase tracking-wide">les antecedent</p>
                                    <div class="flex flex-wrap gap-3">
                                        <c:forEach var="antecedent" items="${queue.medicalRecord.antecedents}">
                                            <span class="text-sm bg-pink text-white px-4 py-2 rounded-full font-bold shadow-md">⚠️ ${antecedent.typeAntecedent}</span>
                                        </c:forEach>
                                        <c:if test="${empty queue.medicalRecord.antecedents}">
                                            <span class="text-sm bg-gray-200 text-gray-600 px-4 py-2 rounded-full font-bold">✓ Aucune allergie connue</span>
                                        </c:if>
                                    </div>
                                </div>

                                <button onclick="openConsultation(
                                        '${queue.id}',
                                        '${queue.medicalRecord.patient.firstName}',
                                        '${queue.medicalRecord.patient.lastName}',
                                        '${queue.medicalRecord.patient.numeroSs}',
                                        '${queue.medicalRecord.patient.birthDate}',
                                        '${queue.medicalRecord.patient.id}',
                                        '${queue.medicalRecord.id}',
                                        '${queue.medicalRecord.latestVitalSign.bloodPressureDiastolic}',
                                        '${queue.medicalRecord.latestVitalSign.bloodPressureSystolic}',
                                        '${queue.medicalRecord.latestVitalSign.temperature}',
                                        '${queue.medicalRecord.latestVitalSign.respiratoryRate}'

                                        )"
                                        class="w-full px-8 py-5 bg-gradient-to-r from-violet to-pink hover:from-violet/90 hover:to-pink/90 text-white rounded-2xl font-bold text-lg transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:scale-105 flex items-center justify-center gap-3">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                                    </svg>
                                    Créer une consultation
                                </button>

                                </button>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${empty queuesList}">
                        <p class="text-center text-gray-500 font-medium">Aucun patient en attente pour le moment.</p>
                    </c:if>
                </div>
            </div>

            <!-- Formulaire de consultation avec design moderne et lumineux -->
            <div id="consultationForm" class="bg-white rounded-3xl p-10 shadow-xl border-4 border-lavender hidden">
                <div class="flex items-center justify-between mb-8">
                    <h2 class="text-3xl font-bold flex items-center gap-4 text-gray-800">
                        <div class="w-12 h-12 bg-gradient-to-br from-violet to-pink rounded-xl flex items-center justify-center">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                            </svg>
                        </div>
                        Consultation - <span id="patientName" class="text-violet"></span>
                    </h2>
                    <button onclick="closeConsultation()" class="text-gray-400 hover:text-gray-600 transition-colors">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>

                <div class="bg-gradient-to-r from-sky to-lavender rounded-2xl p-8 mb-8 shadow-lg">
                    <h3 class="text-lg font-bold text-gray-800 mb-5">Informations du patient</h3>
                    <div class="grid grid-cols-3 gap-6 text-sm">
                        <div>
                            <p class="text-gray-600 mb-2 font-semibold">N° Sécurité Sociale</p>
                            <p class="font-bold text-gray-800 text-base" id="patientSSN"></p>
                        </div>
                        <div>
                            <p class="text-gray-600 mb-2 font-semibold">Date de naissance</p>
                            <p class="font-bold text-gray-800 text-base" id="patientDOB"></p>
                        </div>
                        <div>
                            <p class="text-gray-600 mb-2 font-semibold">Signes vitaux</p>
                            <p class="font-bold text-gray-800 text-xs" id="patientVitals"></p>
                        </div>
                    </div>
                </div>

                <form class="space-y-6" action="${pageContext.request.contextPath}/consultation" method="post">
                    <div>
                        <label class="block text-sm font-bold text-gray-700 mb-3">Motif de consultation *</label>
                        <input type="text" name ="motif" required class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Ex: Douleurs thoraciques, Fièvre persistante...">
                    </div>
                    <input type="hidden"  name="action" value="">
                    <input type="hidden" id="queueId" name="queueId" value="${queue.id}">
                    <input type="hidden" id="medicalRecordId" name="medicalRecordId" >
                    <div>
                        <label class="block text-sm font-bold text-gray-700 mb-3">Symptômes et observations</label>
                        <textarea name="observations" rows="4" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Symptômes rapportés par le patient (ce qu'il ressent et raconte)"></textarea>
                        <p class="text-xs text-gray-500 mt-2 font-medium">Notez les plaintes et symptômes décrits par le patient</p>
                    </div>

                    <div>
                        <label class="block text-sm font-bold text-gray-700 mb-3">Diagnostic</label>
                        <input type="text" name="diagnosis" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Ex: Bronchite aiguë, Hypertension artérielle...">
                        <p class="text-xs text-gray-500 mt-2 font-medium">La maladie identifiée</p>
                    </div>

                    <div>
                        <label class="block text-sm font-bold text-gray-700 mb-3">Prescription / Traitement</label>
                        <textarea name="treatment" rows="5" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Ex:&#10;- Paracétamol 1g, 3 fois/jour pendant 5 jours&#10;- Sirop antitussif, 2 cuillères/jour&#10;- Repos recommandé"></textarea>
                        <p class="text-xs text-gray-500 mt-2 font-medium">Médicaments prescrits avec posologie</p>
                    </div>

                    <!-- Priorité de la consultation -->
                    <div class="mb-6">
                        <label class="block text-sm font-medium text-gray-700 mb-3">
                            Priorité de la consultation
                        </label>
                        <div class="flex gap-6">
                            <label class="flex items-center">
                                <input type="radio" name="priority" value="low" class="w-4 h-4 text-blue-500">
                                <span class="ml-2 text-gray-700">Basse (Low)</span>
                            </label>
                            <label class="flex items-center">
                                <input type="radio" name="priority" value="normal" class="w-4 h-4 text-blue-500">
                                <span class="ml-2 text-gray-700">Normal</span>
                            </label>
                            <label class="flex items-center">
                                <input type="radio" name="priority" value="high" class="w-4 h-4 text-blue-500">
                                <span class="ml-2 text-gray-700">Élevée (High)</span>
                            </label>
                        </div>
                    </div>
                    <div class="border-t-4 border-mint pt-8">
                        <h3 class="text-2xl font-bold mb-6 text-gray-800">Coût de la consultation</h3>
                        <div class="bg-gradient-to-br from-mint to-white rounded-2xl p-8 space-y-4 shadow-lg border-4 border-lime">
                            <!-- Added input fields for cost entry instead of static display -->
                            <div class="flex justify-between items-center text-base">
                                <label class="text-gray-600 font-semibold">Consultation généraliste</label>
                                <div class="flex items-center gap-2">
                                    <input type="number" id="consultationCost" value="150" min="0" step="0.01" class="w-24 bg-white border-2 border-gray-200 rounded-lg px-3 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-ocean/30 focus:border-ocean transition-all" onchange="calculateTotal()">
                                    <span class="font-bold text-gray-800 text-lg">DH</span>
                                </div>
                            </div>
                            <div class="flex justify-between items-center text-base">
                                <label class="text-gray-600 font-semibold">Actes techniques</label>
                                <div class="flex items-center gap-2">
                                    <input type="number" id="technicalCost" value="0" min="0" step="0.01" class="w-24 bg-white border-2 border-gray-200 rounded-lg px-3 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-ocean/30 focus:border-ocean transition-all" onchange="calculateTotal()">
                                    <span class="font-bold text-gray-800 text-lg">DH</span>
                                </div>
                            </div>
                            <div class="flex justify-between items-center text-base">
                                <label class="text-gray-600 font-semibold">Expertise spécialiste</label>
                                <div class="flex items-center gap-2">
                                    <input type="number" id="specialistCost" value="0" min="0" step="0.01" class="w-24 bg-white border-2 border-gray-200 rounded-lg px-3 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-ocean/30 focus:border-ocean transition-all" onchange="calculateTotal()">
                                    <span class="font-bold text-gray-800 text-lg">DH</span>
                                </div>
                            </div>
                            <div class="border-t-4 border-lime pt-4 mt-4 flex justify-between font-bold">
                                <span class="text-gray-800 text-xl">Total</span>
                                <span class="text-lime text-3xl" id="totalCost">150 DH</span>
                                <input  name = "cout" type="hidden" id="totalCost" value="150">
                                <input name="generalistId" value="${sessionScope.user.id}" type="hidden">
                            </div>

                        </div>
                    </div>


                    <script>
                        function calculateTotal() {
                            const consultation = parseFloat(document.getElementById('consultationCost').value) || 0;
                            const technical = parseFloat(document.getElementById('technicalCost').value) || 0;
                            const specialist = parseFloat(document.getElementById('specialistCost').value) || 0;
                            const total = consultation + technical + specialist;
                            document.getElementById('totalCost').textContent = total.toFixed(2) + ' DH';
                        }
                    </script>


                    <div class="flex gap-6 pt-6">
                        <button type="button" onclick="showExpertiseModal()" class="flex-1 px-8 py-5 bg-gradient-to-r from-coral to-pink hover:from-coral/90 hover:to-pink/90 text-white rounded-2xl font-bold text-lg transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:scale-105 flex items-center justify-center gap-3">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                            </svg>
                            Demander avis spécialiste
                        </button>
                        <button type="submit" onclick="document.querySelector('input[name=action]').value='closeConsultation'"  class="flex-1 px-8 py-5 bg-gradient-to-r from-ocean to-violet hover:from-ocean/90 hover:to-violet/90 text-white rounded-2xl font-bold text-lg transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:scale-105 flex items-center justify-center gap-3">

                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                            </svg>
                            Clôturer la consultation
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Sidebar avec design moderne et coloré -->
        <div class="space-y-8">
            <div class="bg-white rounded-3xl p-8 shadow-xl border-4 border-peach">
                <h3 class="text-2xl font-bold mb-6 flex items-center gap-3 text-gray-800">
                    <div class="w-10 h-10 bg-peach rounded-xl flex items-center justify-center">
                        <svg class="w-6 h-6 text-coral" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                        </svg>
                    </div>
                    Demandes d'expertise
                </h3>

                <div class="space-y-5">
                    <div class="bg-gradient-to-r from-peach to-white rounded-2xl p-6 shadow-md border-l-4 border-coral">
                        <div class="flex items-start justify-between mb-4">
                            <div>
                                <p class="font-bold text-gray-800 text-lg">Dr. Marie Leclerc</p>
                                <p class="text-sm text-gray-600 font-medium">Cardiologue</p>
                            </div>
                            <span class="text-xs bg-coral text-white px-4 py-2 rounded-full font-bold">En attente</span>
                        </div>
                        <p class="text-sm text-gray-700 mb-2 font-medium">Patient: Jean Dupont</p>
                        <p class="text-xs text-gray-500 font-medium">Demandé le 13/01/2025 à 10:30</p>
                    </div>

                    <div class="bg-gradient-to-r from-mint to-white rounded-2xl p-6 shadow-md border-l-4 border-lime">
                        <div class="flex items-start justify-between mb-4">
                            <div>
                                <p class="font-bold text-gray-800 text-lg">Dr. Hassan Alami</p>
                                <p class="text-sm text-gray-600 font-medium">Pneumologue</p>
                            </div>
                            <span class="text-xs bg-lime text-white px-4 py-2 rounded-full font-bold">Répondu</span>
                        </div>
                        <p class="text-sm text-gray-700 mb-3 font-medium">Patient: Sophie Martin</p>
                        <button class="text-sm text-ocean hover:text-violet font-bold hover:underline">Voir la réponse →</button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-3xl p-8 shadow-xl border-4 border-rose">
                <h3 class="text-2xl font-bold mb-6 text-gray-800">Statistiques du jour</h3>
                <div class="space-y-5">
                    <div class="flex justify-between items-center py-4 border-b-2 border-gray-100">
                        <span class="text-sm text-gray-600 font-semibold">Consultations terminées</span>
                        <span class="font-bold text-lime text-2xl">13</span>
                    </div>
                    <div class="flex justify-between items-center py-4 border-b-2 border-gray-100">
                        <span class="text-sm text-gray-600 font-semibold">En cours</span>
                        <span class="font-bold text-ocean text-2xl">2</span>
                    </div>
                    <div class="flex justify-between items-center py-4 border-b-2 border-gray-100">
                        <span class="text-sm text-gray-600 font-semibold">Expertises demandées</span>
                        <span class="font-bold text-coral text-2xl">3</span>
                    </div>
                    <div class="flex justify-between items-center py-4">
                        <span class="text-sm text-gray-600 font-semibold">Temps moyen/patient</span>
                        <span class="font-bold text-violet text-2xl">18 min</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal avec design moderne et lumineux -->
<div id="expertiseModal" class="hidden fixed inset-0 bg-gray-900/40 backdrop-blur-md flex items-center justify-center z-50 p-4">
    <div class="bg-white rounded-3xl max-w-3xl w-full max-h-[90vh] overflow-y-auto shadow-2xl border-4 border-ocean">
        <div class="p-10 border-b-4 border-sky flex items-center justify-between bg-gradient-to-r from-sky to-lavender">
            <h3 class="text-3xl font-bold text-gray-800">Demander un avis spécialiste</h3>
            <button onclick="closeExpertiseModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>

        <div class="p-10 space-y-6">
            <div>
                <label class="block text-sm font-bold text-gray-700 mb-3">Spécialité requise *</label>
                <select id="specialtySelect" onchange="loadSpecialists()" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all font-medium">
                    <option value="">Sélectionner une spécialité</option>
                    <option value="cardiologue">Cardiologue</option>
                    <option value="pneumologue">Pneumologue</option>
                    <option value="dermatologue">Dermatologue</option>
                    <option value="neurologue">Neurologue</option>
                    <option value="endocrinologue">Endocrinologue</option>
                </select>
            </div>

            <div id="specialistsList" class="hidden">
                <label class="block text-sm font-bold text-gray-700 mb-3">Spécialiste disponible</label>
                <div class="space-y-4">
                    <div class="bg-gradient-to-r from-sky to-white border-4 border-ocean rounded-2xl p-6 hover:shadow-xl cursor-pointer transition-all duration-300 transform hover:scale-[1.02]">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="font-bold text-gray-800 text-xl">Dr. Marie Leclerc</p>
                                <p class="text-sm text-gray-600 font-medium">Cardiologue - 15 ans d'expérience</p>
                            </div>
                            <div class="text-right">
                                <p class="font-bold text-ocean text-3xl">300 DH</p>
                                <p class="text-xs text-gray-500 font-medium">par consultation</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="slotsSection" class="hidden">
                <label class="block text-sm font-bold text-gray-700 mb-3">Créneaux disponibles</label>
                <div class="grid grid-cols-3 gap-4">
                    <button type="button" class="px-5 py-4 bg-gray-50 border-2 border-gray-200 rounded-2xl hover:border-ocean hover:bg-sky transition-all duration-200 text-sm font-bold text-gray-700 hover:text-ocean">
                        09:00 - 09:30
                    </button>
                    <button type="button" class="px-5 py-4 bg-gray-50 border-2 border-gray-200 rounded-2xl hover:border-ocean hover:bg-sky transition-all duration-200 text-sm font-bold text-gray-700 hover:text-ocean">
                        09:30 - 10:00
                    </button>
                    <button type="button" class="px-5 py-4 bg-gray-50 border-2 border-gray-200 rounded-2xl hover:border-ocean hover:bg-sky transition-all duration-200 text-sm font-bold text-gray-700 hover:text-ocean">
                        10:00 - 10:30
                    </button>
                    <button type="button" class="px-5 py-4 bg-gray-200 border-2 border-gray-300 rounded-2xl text-gray-400 cursor-not-allowed text-sm font-bold" disabled>
                        10:30 - 11:00
                    </button>
                    <button type="button" class="px-5 py-4 bg-gray-50 border-2 border-gray-200 rounded-2xl hover:border-ocean hover:bg-sky transition-all duration-200 text-sm font-bold text-gray-700 hover:text-ocean">
                        11:00 - 11:30
                    </button>
                    <button type="button" class="px-5 py-4 bg-gray-50 border-2 border-gray-200 rounded-2xl hover:border-ocean hover:bg-sky transition-all duration-200 text-sm font-bold text-gray-700 hover:text-ocean">
                        11:30 - 12:00
                    </button>
                </div>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-700 mb-3">Priorité</label>
                <select class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all font-medium">
                    <option value="normale">Normale</option>
                    <option value="urgente">Urgente</option>
                    <option value="non_urgente">Non urgente</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-700 mb-3">Question au spécialiste *</label>
                <textarea rows="4" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Décrivez la situation et la question que vous souhaitez poser..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-700 mb-3">Données et analyses complémentaires</label>
                <textarea rows="3" class="w-full bg-gray-50 border-2 border-gray-200 rounded-2xl px-6 py-4 text-gray-800 focus:outline-none focus:ring-4 focus:ring-ocean/30 focus:border-ocean transition-all" placeholder="Résultats d'examens, analyses, etc."></textarea>
            </div>

            <div class="flex gap-6 pt-6">
                <button type="button" onclick="closeExpertiseModal()" class="flex-1 px-8 py-5 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-2xl font-bold text-lg transition-all duration-200">
                    Annuler
                </button>
                <button type="button" onclick="submitExpertise()" class="flex-1 px-8 py-5 bg-gradient-to-r from-ocean to-violet hover:from-ocean/90 hover:to-violet/90 text-white rounded-2xl font-bold text-lg transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:scale-105">
                    Envoyer la demande
                </button>
            </div>
        </div>
    </div>
</div>
<button
        class="w-full px-8 py-5 bg-gradient-to-r from-violet to-pink hover:from-violet/90 hover:to-pink/90 text-white rounded-2xl font-bold text-lg transition-all duration-300 shadow-xl hover:shadow-2xl transform hover:scale-105 flex items-center justify-center gap-3">
    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
    </svg>
    Créer une consultation
</button>
<script>
    function openConsultation(queueId , firstName,lastName , ssn, dob, patientId,medicalRecordId  ) {
        document.getElementById('consultationForm').classList.remove('hidden');
        document.getElementById('patientName').textContent = firstName + lastName;
        document.getElementById('patientSSN').textContent = ssn;
        document.getElementById('patientDOB').textContent = dob;
        document.getElementById('medicalRecordId').value= medicalRecordId;
        document.getElementById('queueId').value=queueId ;


        setTimeout(() => {
            document.getElementById('consultationForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }, 100);
    }

    function closeConsultation() {
        document.getElementById('consultationForm').classList.add('hidden');
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function showExpertiseModal() {
        document.querySelector('input[name=action]').value='askExpertise';
        document.getElementById('expertiseModal').classList.remove('hidden');
    }

    function closeExpertiseModal() {
        document.getElementById('expertiseModal').classList.add('hidden');
    }

    function loadSpecialists() {
        const specialty = document.getElementById('specialtySelect').value;
        if (specialty) {
            document.getElementById('specialistsList').classList.remove('hidden');
            document.getElementById('slotsSection').classList.remove('hidden');
        }
    }

    function submitExpertise() {
        alert('Demande d\'expertise envoyée avec succès!');
        closeExpertiseModal();
    }

    function logout() {
        if (confirm('Êtes-vous sûr de vouloir vous déconnecter?')) {
            window.location.href = 'login.html';
        }
    }
</script>
</body>
</html>
