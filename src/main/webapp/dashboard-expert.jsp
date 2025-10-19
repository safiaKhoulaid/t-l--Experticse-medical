<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Médecin Spécialiste - TéléExpertise</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
        }
        .gradient-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .gradient-stat-1 {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .gradient-stat-2 {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        .gradient-stat-3 {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        .gradient-stat-4 {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }
        .tab-active {
            border-bottom: 3px solid #667eea;
            color: #667eea;
        }
        .tab-inactive {
            border-bottom: 3px solid transparent;
            color: #9ca3af;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 via-white to-purple-50 text-gray-900 min-h-screen">
<!-- Updated header with modern luxury design -->
<header class="gradient-header text-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <div class="flex items-center gap-6">
                <div class="flex items-center gap-3">
                    <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    <span class="text-2xl font-bold">TéléExpertise</span>
                </div>
                <span class="text-sm text-white/80 border-l border-white/30 pl-6">Médecin Spécialiste</span>
            </div>
            <div class="flex items-center gap-6">
                <div class="text-right">
                    <c:if test = "not empty SessionScope.user">
                    <p class="text-sm font-semibold">${SessionScope.user.firstName} ${SessionScope.user.lastName}</p>
                    <p class="text-xs text-white/80">SessionScope.user.</p>
                    </c:if>
                </div>
                <button onclick="logout()" class="px-5 py-2.5 text-sm bg-white/20 hover:bg-white/30 rounded-lg transition-all duration-200 font-medium">
                    Déconnexion
                </button>
            </div>
        </div>
    </div>
</header>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
    <!-- Modern gradient stat cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
        <div class="gradient-stat-1 text-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-200">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-white/80 font-medium mb-2">Demandes en attente</p>
                    <p class="text-4xl font-bold">5</p>
                </div>
                <svg class="w-12 h-12 text-white/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
        </div>

        <div class="gradient-stat-2 text-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-200">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-white/80 font-medium mb-2">Expertises du jour</p>
                    <p class="text-4xl font-bold">8</p>
                </div>
                <svg class="w-12 h-12 text-white/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                </svg>
            </div>
        </div>

        <div class="gradient-stat-3 text-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-200">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-white/80 font-medium mb-2">Créneaux disponibles</p>
                    <p class="text-4xl font-bold">12</p>
                </div>
                <svg class="w-12 h-12 text-white/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
            </div>
        </div>

        <div class="gradient-stat-4 text-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-200">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-white/80 font-medium mb-2">Revenu du jour</p>
                    <p class="text-4xl font-bold">2,400<span class="text-lg">DH</span></p>
                </div>
                <svg class="w-12 h-12 text-white/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
        </div>
    </div>

    <!-- Tab navigation for different sections -->
    <div class="bg-white rounded-2xl shadow-lg mb-8 overflow-hidden">
        <div class="flex border-b border-gray-200">
            <button onclick="switchTab('demandes')" class="tab-active flex-1 py-4 px-6 font-semibold text-center transition-all duration-200 flex items-center justify-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                </svg>
                Demandes d'expertise
            </button>
            <button onclick="switchTab('creneaux')" class="tab-inactive flex-1 py-4 px-6 font-semibold text-center transition-all duration-200 flex items-center justify-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
                Gestion des créneaux
            </button>
            <button onclick="switchTab('profil')" class="tab-inactive flex-1 py-4 px-6 font-semibold text-center transition-all duration-200 flex items-center justify-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                </svg>
                Mon profil
            </button>
        </div>
    </div>

    <!-- Tab content sections -->
    <div id="demandes-tab" class="space-y-8">
        <div class="bg-white rounded-2xl shadow-lg p-8">
            <div class="flex items-center justify-between mb-8">
                <h2 class="text-2xl font-bold flex items-center gap-3">
                    <svg class="w-7 h-7 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                    </svg>
                    Demandes d'expertise
                </h2>
                <div class="flex gap-2">
                    <button onclick="filterRequests('all')" class="px-4 py-2 bg-gradient-to-r from-purple-600 to-pink-600 text-white rounded-lg text-sm font-medium shadow-md hover:shadow-lg transition-all">
                        Toutes (13)
                    </button>
                    <button onclick="filterRequests('pending')" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-sm font-medium transition-all">
                        En attente (5)
                    </button>
                    <button onclick="filterRequests('urgent')" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-sm font-medium transition-all">
                        Urgentes (2)
                    </button>
                </div>
            </div>

            <div class="space-y-5">
                <!-- Urgent request -->
                <div class="bg-gradient-to-r from-red-50 to-pink-50 border-l-4 border-red-500 rounded-xl p-6 hover:shadow-lg transition-all duration-200">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-3">
                                <span class="text-xs bg-red-100 text-red-700 px-3 py-1.5 rounded-full font-bold">🔴 URGENTE</span>
                                <span class="text-xs text-gray-500">Il y a 15 min</span>
                            </div>
                            <p class="font-bold text-lg text-gray-900 mb-1">Patient: Ahmed Benali</p>
                            <p class="text-sm text-gray-600">Demandé par: Dr. Pierre Moreau (Généraliste)</p>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-5 mb-4 border border-gray-200">
                        <p class="text-sm font-semibold text-gray-900 mb-2">Question:</p>
                        <p class="text-sm text-gray-600 leading-relaxed">Patient de 65 ans avec douleurs thoraciques intermittentes depuis 3 jours. ECG montre des anomalies ST-T. Antécédents d'HTA. Besoin d'avis urgent sur conduite à tenir.</p>
                    </div>

                    <div class="grid grid-cols-2 gap-6 mb-5 text-sm">
                        <div>
                            <p class="text-gray-600 font-medium mb-1">Signes vitaux</p>
                            <p class="text-gray-700">TA: 145/90 | FC: 88 bpm</p>
                            <p class="text-gray-700">T: 37.1°C</p>
                        </div>
                        <div>
                            <p class="text-gray-600 font-medium mb-1">Analyses disponibles</p>
                            <p class="text-gray-700">ECG, Bilan sanguin</p>
                        </div>
                    </div>

                    <button onclick="openExpertiseResponse('Ahmed Benali')" class="w-full px-5 py-3 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white rounded-xl font-semibold transition-all duration-200 shadow-md hover:shadow-lg">
                        Répondre à la demande
                    </button>
                </div>

                <!-- Normal request -->
                <div class="bg-gradient-to-r from-amber-50 to-orange-50 border-l-4 border-amber-500 rounded-xl p-6 hover:shadow-lg transition-all duration-200">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-3">
                                <span class="text-xs bg-amber-100 text-amber-700 px-3 py-1.5 rounded-full font-bold">🟡 NORMALE</span>
                                <span class="text-xs text-gray-500">Il y a 1h</span>
                            </div>
                            <p class="font-bold text-lg text-gray-900 mb-1">Patient: Sophie Martin</p>
                            <p class="text-sm text-gray-600">Demandé par: Dr. Karim Alaoui (Généraliste)</p>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-5 mb-4 border border-gray-200">
                        <p class="text-sm font-semibold text-gray-900 mb-2">Question:</p>
                        <p class="text-sm text-gray-600 leading-relaxed">Patiente de 42 ans avec palpitations occasionnelles. Holter ECG 24h disponible. Demande interprétation et recommandations.</p>
                    </div>

                    <div class="grid grid-cols-2 gap-6 mb-5 text-sm">
                        <div>
                            <p class="text-gray-600 font-medium mb-1">Signes vitaux</p>
                            <p class="text-gray-700">TA: 120/75 | FC: 72 bpm</p>
                            <p class="text-gray-700">T: 36.8°C</p>
                        </div>
                        <div>
                            <p class="text-gray-600 font-medium mb-1">Analyses disponibles</p>
                            <p class="text-gray-700">Holter ECG 24h</p>
                        </div>
                    </div>

                    <button onclick="openExpertiseResponse('Sophie Martin')" class="w-full px-5 py-3 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white rounded-xl font-semibold transition-all duration-200 shadow-md hover:shadow-lg">
                        Répondre à la demande
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Schedule management tab -->
    <div id="creneaux-tab" class="hidden space-y-8">
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
            <!-- Calendar -->
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <h3 class="text-lg font-bold mb-6 flex items-center gap-2">
                    <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                    Sélectionner une date
                </h3>
                <input type="date" id="scheduleDate" class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors" onchange="updateSchedule()">

                <div class="mt-6 space-y-2">
                    <p class="text-sm font-semibold text-gray-700 mb-3">Légende:</p>
                    <div class="flex items-center gap-2 text-sm">
                        <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                        <span class="text-gray-600">Disponible</span>
                    </div>
                    <div class="flex items-center gap-2 text-sm">
                        <div class="w-3 h-3 bg-blue-500 rounded-full"></div>
                        <span class="text-gray-600">Réservé</span>
                    </div>
                    <div class="flex items-center gap-2 text-sm">
                        <div class="w-3 h-3 bg-gray-400 rounded-full"></div>
                        <span class="text-gray-600">Passé</span>
                    </div>
                </div>
            </div>

            <!-- Schedule slots -->
            <div class="lg:col-span-3 bg-white rounded-2xl shadow-lg p-8">
                <h3 class="text-lg font-bold mb-6">Créneaux horaires</h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <!-- Morning slots -->
                    <div>
                        <p class="text-sm font-semibold text-gray-700 mb-3 pb-3 border-b-2 border-purple-200">Matin</p>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">09:00 - 09:30</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">09:30 - 10:00</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-blue-50 border-2 border-blue-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">10:00 - 10:30</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-blue-200 text-blue-800 px-2 py-1 rounded-full font-bold">● Réservé</span>
                                    <button onclick="cancelReservation(this)" class="text-blue-600 hover:text-blue-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-gray-100 border-2 border-gray-300 rounded-xl opacity-60">
                                <span class="font-semibold text-gray-500">10:30 - 11:00</span>
                                <span class="text-xs bg-gray-300 text-gray-700 px-2 py-1 rounded-full font-bold">✕ Passé</span>
                            </div>
                        </div>
                    </div>

                    <!-- Afternoon slots -->
                    <div>
                        <p class="text-sm font-semibold text-gray-700 mb-3 pb-3 border-b-2 border-purple-200">Après-midi</p>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">14:00 - 14:30</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">14:30 - 15:00</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">15:00 - 15:30</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="flex items-center justify-between p-4 bg-green-50 border-2 border-green-300 rounded-xl hover:shadow-md transition-all cursor-pointer">
                                <span class="font-semibold text-gray-900">15:30 - 16:00</span>
                                <div class="flex items-center gap-2">
                                    <span class="text-xs bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">✓ Libre</span>
                                    <button onclick="toggleSlot(this)" class="text-green-600 hover:text-green-800">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <button onclick="saveSchedule()" class="mt-8 w-full px-6 py-4 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white rounded-xl font-bold transition-all duration-200 shadow-md hover:shadow-lg">
                    💾 Enregistrer les modifications
                </button>
            </div>
        </div>
    </div>

    <!-- Profile tab -->
    <div id="profil-tab" class="hidden space-y-8">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-2xl shadow-lg p-8">
                <h3 class="text-2xl font-bold mb-8">Configurer mon profil</h3>

                <div class="space-y-6">
                    <div>
                        <label class="block text-sm font-bold text-gray-900 mb-3">Spécialité *</label>
                        <select class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors font-medium">
                            <option value="cardiologue" selected>Cardiologue</option>
                            <option value="pneumologue">Pneumologue</option>
                            <option value="dermatologue">Dermatologue</option>
                            <option value="neurologue">Neurologue</option>
                            <option value="endocrinologue">Endocrinologue</option>
                        </select>
                    </div>

                    <div>
                        <label class="block text-sm font-bold text-gray-900 mb-3">Tarif par consultation (DH) *</label>
                        <input type="number" value="300" class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors font-medium">
                    </div>

                    <div>
                        <label class="block text-sm font-bold text-gray-900 mb-3">Durée moyenne de consultation</label>
                        <input type="text" value="30 minutes" disabled class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl bg-gray-100 text-gray-500 cursor-not-allowed font-medium">
                        <p class="text-xs text-gray-500 mt-2">La durée est fixée à 30 minutes par défaut</p>
                    </div>

                    <button class="w-full px-6 py-4 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white rounded-xl font-bold transition-all duration-200 shadow-md hover:shadow-lg">
                        Enregistrer les modifications
                    </button>
                </div>
            </div>

            <div class="space-y-8">
                <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-2xl shadow-lg p-8 border-2 border-purple-200">
                    <h4 class="font-bold text-gray-900 mb-6">Mon profil</h4>
                    <div class="space-y-4 text-sm">
                        <div class="flex justify-between py-3 border-b border-purple-200">
                            <span class="text-gray-600">Spécialité</span>
                            <span class="font-bold text-gray-900">Cardiologue</span>
                        </div>
                        <div class="flex justify-between py-3 border-b border-purple-200">
                            <span class="text-gray-600">Tarif consultation</span>
                            <span class="font-bold text-purple-600">300 DH</span>
                        </div>
                        <div class="flex justify-between py-3 border-b border-purple-200">
                            <span class="text-gray-600">Durée consultation</span>
                            <span class="font-bold text-gray-900">30 min</span>
                        </div>
                        <div class="flex justify-between py-3">
                            <span class="text-gray-600">Statut</span>
                            <span class="text-green-600 font-bold">🟢 Actif</span>
                        </div>
                    </div>
                </div>

                <div class="bg-gradient-to-br from-blue-50 to-cyan-50 rounded-2xl shadow-lg p-8 border-2 border-blue-200">
                    <h4 class="font-bold text-gray-900 mb-6">Statistiques</h4>
                    <div class="space-y-4 text-sm">
                        <div class="flex justify-between py-3 border-b border-blue-200">
                            <span class="text-gray-600">Expertises ce mois</span>
                            <span class="font-bold text-gray-900">47</span>
                        </div>
                        <div class="flex justify-between py-3 border-b border-blue-200">
                            <span class="text-gray-600">Temps de réponse moyen</span>
                            <span class="font-bold text-gray-900">2h 15min</span>
                        </div>
                        <div class="flex justify-between py-3 border-b border-blue-200">
                            <span class="text-gray-600">Taux de satisfaction</span>
                            <span class="font-bold text-green-600">98%</span>
                        </div>
                        <div class="flex justify-between py-3">
                            <span class="text-gray-600">Revenu ce mois</span>
                            <span class="font-bold text-purple-600">14,100 DH</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Updated response modal with luxury styling -->
<div id="responseModal" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4">
    <div class="bg-white rounded-2xl max-w-3xl w-full max-h-[90vh] overflow-y-auto shadow-2xl">
        <div class="p-8 border-b border-gray-200 flex items-center justify-between">
            <h3 class="text-2xl font-bold text-gray-900">Répondre à la demande d'expertise</h3>
            <button onclick="closeResponseModal()" class="text-gray-400 hover:text-gray-600 transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>

        <div class="p-8 space-y-6">
            <div class="bg-purple-50 rounded-xl p-6 border-2 border-purple-200">
                <h4 class="font-bold mb-4 text-gray-900">Informations patient</h4>
                <div class="grid grid-cols-2 gap-6 text-sm">
                    <div>
                        <p class="text-gray-600 font-medium mb-1">Patient</p>
                        <p class="text-gray-900 font-bold" id="modalPatientName">Ahmed Benali</p>
                    </div>
                    <div>
                        <p class="text-gray-600 font-medium mb-1">Médecin demandeur</p>
                        <p class="text-gray-900 font-bold">Dr. Pierre Moreau</p>
                    </div>
                    <div>
                        <p class="text-gray-600 font-medium mb-1">Signes vitaux</p>
                        <p class="text-gray-700">TA: 145/90 | FC: 88 bpm</p>
                    </div>
                    <div>
                        <p class="text-gray-600 font-medium mb-1">Priorité</p>
                        <p class="text-red-600 font-bold">🔴 URGENTE</p>
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-900 mb-3">Avis médical *</label>
                <textarea rows="6" class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors" placeholder="Votre diagnostic et analyse de la situation..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-900 mb-3">Recommandations *</label>
                <textarea rows="5" class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors" placeholder="Vos recommandations pour la prise en charge..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-bold text-gray-900 mb-3">Examens complémentaires suggérés</label>
                <textarea rows="3" class="w-full px-4 py-3 border-2 border-purple-200 rounded-xl focus:outline-none focus:border-purple-600 transition-colors" placeholder="Examens ou analyses supplémentaires recommandés..."></textarea>
            </div>

            <div class="flex gap-4 pt-4">
                <button onclick="closeResponseModal()" class="flex-1 px-6 py-4 bg-gray-100 hover:bg-gray-200 text-gray-900 rounded-xl font-bold transition-all duration-200">
                    Annuler
                </button>
                <button onclick="submitResponse()" class="flex-1 px-6 py-4 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-purple-700 hover:to-pink-700 text-white rounded-xl font-bold transition-all duration-200 shadow-md hover:shadow-lg">
                    Envoyer la réponse
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function switchTab(tab) {
        // Hide all tabs
        document.getElementById('demandes-tab').classList.add('hidden');
        document.getElementById('creneaux-tab').classList.add('hidden');
        document.getElementById('profil-tab').classList.add('hidden');

        // Show selected tab
        document.getElementById(tab + '-tab').classList.remove('hidden');

        // Update tab buttons
        const buttons = document.querySelectorAll('.flex.border-b.border-gray-200 button');
        buttons.forEach(btn => btn.classList.remove('tab-active'));
        buttons.forEach(btn => btn.classList.add('tab-inactive'));
        event.target.closest('button').classList.remove('tab-inactive');
        event.target.closest('button').classList.add('tab-active');
    }

    function updateSchedule() {
        const date = document.getElementById('scheduleDate').value;
        console.log('Schedule updated for:', date);
    }

    function toggleSlot(element) {
        element.closest('.flex').classList.toggle('opacity-50');
    }

    function cancelReservation(element) {
        if (confirm('Êtes-vous sûr de vouloir annuler cette réservation?')) {
            alert('Réservation annulée');
        }
    }

    function saveSchedule() {
        alert('Créneaux enregistrés avec succès!');
    }

    function openExpertiseResponse(patientName) {
        document.getElementById('modalPatientName').textContent = patientName;
        document.getElementById('responseModal').classList.remove('hidden');
    }

    function closeResponseModal() {
        document.getElementById('responseModal').classList.add('hidden');
    }

    function submitResponse() {
        alert('Réponse envoyée avec succès!');
        closeResponseModal();
    }

    function filterRequests(filter) {
        console.log('Filtering by:', filter);
    }

    function logout() {
        if (confirm('Êtes-vous sûr de vouloir vous déconnecter?')) {
            window.location.href = 'login.html';
        }
    }

    // Set today's date as default
    document.getElementById('scheduleDate').valueAsDate = new Date();
</script>
</body>
</html>
