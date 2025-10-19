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
