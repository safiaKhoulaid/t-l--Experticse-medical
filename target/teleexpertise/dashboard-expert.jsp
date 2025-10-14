<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Médecin Généraliste - TéléExpertise</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#10b981',
                        'dark-bg': '#0a0a0a',
                        'dark-card': '#1a1a1a',
                        'dark-border': '#2a2a2a',
                        'dark-hover': '#252525',
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-dark-bg text-gray-100 min-h-screen">
Header
<header class="bg-dark-card border-b border-dark-border">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-2">
                    <svg class="w-8 h-8 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    <span class="text-xl font-semibold">TéléExpertise</span>
                </div>
                <span class="text-sm text-gray-400 border-l border-dark-border pl-4">Médecin Généraliste</span>
            </div>
            <div class="flex items-center gap-4">
                <div class="text-right">
                    <p class="text-sm font-medium">Dr. Pierre Moreau</p>
                    <p class="text-xs text-gray-400">Médecin Généraliste</p>
                </div>
                <button onclick="logout()" class="px-4 py-2 text-sm bg-dark-hover hover:bg-dark-border rounded-lg transition-colors">
                    Déconnexion
                </button>
            </div>
        </div>
    </div>
</header>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    Stats Cards
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="bg-dark-card border border-dark-border rounded-xl p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-400">Patients en attente</p>
                    <p class="text-3xl font-bold mt-2">8</p>
                </div>
                <div class="w-12 h-12 bg-primary/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-dark-card border border-dark-border rounded-xl p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-400">Consultations du jour</p>
                    <p class="text-3xl font-bold mt-2">15</p>
                </div>
                <div class="w-12 h-12 bg-blue-500/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-dark-card border border-dark-border rounded-xl p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-400">Expertises demandées</p>
                    <p class="text-3xl font-bold mt-2">3</p>
                </div>
                <div class="w-12 h-12 bg-yellow-500/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-yellow-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-dark-card border border-dark-border rounded-xl p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-400">Revenu du jour</p>
                    <p class="text-3xl font-bold mt-2">2,850<span class="text-lg text-gray-400">DH</span></p>
                </div>
                <div class="w-12 h-12 bg-green-500/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>

    Main Content
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        Left Column - Patient Queue & Consultation
        <div class="lg:col-span-2 space-y-6">
            Patient Queue
            <div class="bg-dark-card border border-dark-border rounded-xl p-6">
                <h2 class="text-xl font-semibold mb-6 flex items-center gap-2">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                    </svg>
                    File d'attente
                </h2>

                <div class="space-y-3">
                    <div class="bg-dark-bg border border-dark-border rounded-lg p-4 hover:border-primary/50 transition-colors cursor-pointer" onclick="openConsultation('Ahmed Benali')">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex-1">
                                <p class="font-medium text-lg">Ahmed Benali</p>
                                <p class="text-sm text-gray-400">N° 2 95 07 75 123 456 78</p>
                            </div>
                            <span class="text-xs bg-yellow-500/10 text-yellow-500 px-3 py-1 rounded-full">15 min</span>
                        </div>
                        <div class="grid grid-cols-2 gap-4 text-sm">
                            <div>
                                <p class="text-gray-400">Signes vitaux</p>
                                <p class="text-gray-200">TA: 130/85 | FC: 78 bpm</p>
                                <p class="text-gray-200">T: 37.2°C | FR: 18/min</p>
                            </div>
                            <div>
                                <p class="text-gray-400">Arrivée</p>
                                <p class="text-gray-200">09:15</p>
                            </div>
                        </div>
                        <button class="mt-3 w-full px-4 py-2 bg-primary hover:bg-primary/90 text-white rounded-lg font-medium transition-colors">
                            Commencer la consultation
                        </button>
                    </div>

                    <div class="bg-dark-bg border border-dark-border rounded-lg p-4 hover:border-primary/50 transition-colors cursor-pointer">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex-1">
                                <p class="font-medium text-lg">Sophie Martin</p>
                                <p class="text-sm text-gray-400">N° 1 85 03 45 987 654 32</p>
                            </div>
                            <span class="text-xs bg-green-500/10 text-green-500 px-3 py-1 rounded-full">5 min</span>
                        </div>
                        <div class="grid grid-cols-2 gap-4 text-sm">
                            <div>
                                <p class="text-gray-400">Signes vitaux</p>
                                <p class="text-gray-200">TA: 120/75 | FC: 72 bpm</p>
                                <p class="text-gray-200">T: 36.8°C | FR: 16/min</p>
                            </div>
                            <div>
                                <p class="text-gray-400">Arrivée</p>
                                <p class="text-gray-200">09:25</p>
                            </div>
                        </div>
                        <button class="mt-3 w-full px-4 py-2 bg-primary hover:bg-primary/90 text-white rounded-lg font-medium transition-colors">
                            Commencer la consultation
                        </button>
                    </div>
                </div>
            </div>

            Consultation Form (Hidden by default)
            <div id="consultationForm" class="bg-dark-card border border-dark-border rounded-xl p-6 hidden">
                <h2 class="text-xl font-semibold mb-6 flex items-center gap-2">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Consultation - <span id="patientName">Ahmed Benali</span>
                </h2>

                <form class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-300 mb-2">Motif de consultation *</label>
                        <input type="text" required class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-300 mb-2">Examen clinique</label>
                        <textarea rows="4" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Description de l'examen physique..."></textarea>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-300 mb-2">Symptômes et observations</label>
                        <textarea rows="4" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Symptômes rapportés par le patient..."></textarea>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-300 mb-2">Diagnostic</label>
                        <input type="text" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary">
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-300 mb-2">Prescription</label>
                        <textarea rows="4" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Médicaments prescrits..."></textarea>
                    </div>

                    <div class="border-t border-dark-border pt-6">
                        <h3 class="text-lg font-medium mb-4">Coût de la consultation</h3>
                        <div class="bg-dark-bg rounded-lg p-4 space-y-2">
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-400">Consultation généraliste</span>
                                <span class="font-medium">150 DH</span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-400">Actes techniques</span>
                                <span class="font-medium">0 DH</span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-gray-400">Expertise spécialiste</span>
                                <span class="font-medium">0 DH</span>
                            </div>
                            <div class="border-t border-dark-border pt-2 mt-2 flex justify-between font-semibold">
                                <span>Total</span>
                                <span class="text-primary">150 DH</span>
                            </div>
                        </div>
                    </div>

                    <div class="flex gap-3">
                        <button type="button" onclick="showExpertiseModal()" class="flex-1 px-6 py-3 bg-yellow-500 hover:bg-yellow-600 text-white rounded-lg font-medium transition-colors">
                            Demander avis spécialiste
                        </button>
                        <button type="submit" class="flex-1 px-6 py-3 bg-primary hover:bg-primary/90 text-white rounded-lg font-medium transition-colors">
                            Clôturer la consultation
                        </button>
                    </div>
                </form>
            </div>
        </div>

        Right Column - Recent Consultations & Expertise Requests
        <div class="space-y-6">
            Expertise Requests
            <div class="bg-dark-card border border-dark-border rounded-xl p-6">
                <h3 class="text-lg font-semibold mb-4 flex items-center gap-2">
                    <svg class="w-5 h-5 text-yellow-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/>
                    </svg>
                    Demandes d'expertise
                </h3>

                <div class="space-y-3">
                    <div class="bg-dark-bg border border-yellow-500/30 rounded-lg p-4">
                        <div class="flex items-start justify-between mb-2">
                            <div>
                                <p class="font-medium">Marie Leclerc</p>
                                <p class="text-sm text-gray-400">Cardiologue</p>
                            </div>
                            <span class="text-xs bg-yellow-500/10 text-yellow-500 px-2 py-1 rounded">En attente</span>
                        </div>
                        <p class="text-sm text-gray-400 mb-2">Patient: Jean Dupont</p>
                        <p class="text-xs text-gray-500">Demandé le 13/01/2025 à 10:30</p>
                    </div>

                    <div class="bg-dark-bg border border-green-500/30 rounded-lg p-4">
                        <div class="flex items-start justify-between mb-2">
                            <div>
                                <p class="font-medium">Dr. Hassan Alami</p>
                                <p class="text-sm text-gray-400">Pneumologue</p>
                            </div>
                            <span class="text-xs bg-green-500/10 text-green-500 px-2 py-1 rounded">Répondu</span>
                        </div>
                        <p class="text-sm text-gray-400 mb-2">Patient: Sophie Martin</p>
                        <button class="text-xs text-primary hover:underline">Voir la réponse</button>
                    </div>
                </div>
            </div>

            Quick Stats
            <div class="bg-dark-card border border-dark-border rounded-xl p-6">
                <h3 class="text-lg font-semibold mb-4">Statistiques du jour</h3>
                <div class="space-y-3">
                    <div class="flex justify-between items-center py-2 border-b border-dark-border">
                        <span class="text-sm text-gray-400">Consultations terminées</span>
                        <span class="font-medium text-green-500">13</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-dark-border">
                        <span class="text-sm text-gray-400">En cours</span>
                        <span class="font-medium text-blue-500">2</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-dark-border">
                        <span class="text-sm text-gray-400">Expertises demandées</span>
                        <span class="font-medium text-yellow-500">3</span>
                    </div>
                    <div class="flex justify-between items-center py-2">
                        <span class="text-sm text-gray-400">Temps moyen/patient</span>
                        <span class="font-medium">18 min</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Expertise Request Modal
<div id="expertiseModal" class="hidden fixed inset-0 bg-black/80 flex items-center justify-center z-50 p-4">
    <div class="bg-dark-card border border-dark-border rounded-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div class="p-6 border-b border-dark-border flex items-center justify-between">
            <h3 class="text-xl font-semibold">Demander un avis spécialiste</h3>
            <button onclick="closeExpertiseModal()" class="text-gray-400 hover:text-gray-200">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>
        </div>

        <div class="p-6 space-y-6">
            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Spécialité requise *</label>
                <select id="specialtySelect" onchange="loadSpecialists()" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary">
                    <option value="">Sélectionner une spécialité</option>
                    <option value="cardiologue">Cardiologue</option>
                    <option value="pneumologue">Pneumologue</option>
                    <option value="dermatologue">Dermatologue</option>
                    <option value="neurologue">Neurologue</option>
                    <option value="endocrinologue">Endocrinologue</option>
                </select>
            </div>

            <div id="specialistsList" class="hidden">
                <label class="block text-sm font-medium text-gray-300 mb-2">Spécialiste disponible</label>
                <div class="space-y-2">
                    <div class="bg-dark-bg border border-dark-border rounded-lg p-4 hover:border-primary cursor-pointer transition-colors">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="font-medium">Dr. Marie Leclerc</p>
                                <p class="text-sm text-gray-400">Cardiologue - 15 ans d'expérience</p>
                            </div>
                            <div class="text-right">
                                <p class="font-semibold text-primary">300 DH</p>
                                <p class="text-xs text-gray-400">par consultation</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="slotsSection" class="hidden">
                <label class="block text-sm font-medium text-gray-300 mb-2">Créneaux disponibles</label>
                <div class="grid grid-cols-3 gap-2">
                    <button class="px-4 py-2 bg-dark-bg border border-dark-border rounded-lg hover:border-primary transition-colors text-sm">
                        09:00 - 09:30
                    </button>
                    <button class="px-4 py-2 bg-dark-bg border border-dark-border rounded-lg hover:border-primary transition-colors text-sm">
                        09:30 - 10:00
                    </button>
                    <button class="px-4 py-2 bg-dark-bg border border-dark-border rounded-lg hover:border-primary transition-colors text-sm">
                        10:00 - 10:30
                    </button>
                    <button class="px-4 py-2 bg-dark-bg border border-gray-600 rounded-lg text-gray-600 cursor-not-allowed text-sm" disabled>
                        10:30 - 11:00
                    </button>
                    <button class="px-4 py-2 bg-dark-bg border border-dark-border rounded-lg hover:border-primary transition-colors text-sm">
                        11:00 - 11:30
                    </button>
                    <button class="px-4 py-2 bg-dark-bg border border-dark-border rounded-lg hover:border-primary transition-colors text-sm">
                        11:30 - 12:00
                    </button>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Priorité</label>
                <select class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary">
                    <option value="normale">Normale</option>
                    <option value="urgente">Urgente</option>
                    <option value="non_urgente">Non urgente</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Question au spécialiste *</label>
                <textarea rows="4" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Décrivez la situation et la question que vous souhaitez poser..."></textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-300 mb-2">Données et analyses complémentaires</label>
                <textarea rows="3" class="w-full bg-dark-bg border border-dark-border rounded-lg px-4 py-2.5 text-gray-100 focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Résultats d'examens, analyses, etc."></textarea>
            </div>

            <div class="flex gap-3 pt-4">
                <button onclick="closeExpertiseModal()" class="flex-1 px-6 py-3 bg-dark-hover hover:bg-dark-border text-gray-300 rounded-lg font-medium transition-colors">
                    Annuler
                </button>
                <button onclick="submitExpertise()" class="flex-1 px-6 py-3 bg-primary hover:bg-primary/90 text-white rounded-lg font-medium transition-colors">
                    Envoyer la demande
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function openConsultation(patientName) {
        document.getElementById('consultationForm').classList.remove('hidden');
        document.getElementById('patientName').textContent = patientName;
        window.scrollTo({ top: document.getElementById('consultationForm').offsetTop - 100, behavior: 'smooth' });
    }

    function showExpertiseModal() {
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
