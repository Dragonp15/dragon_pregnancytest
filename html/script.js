window.addEventListener('message', function(event) {
    if (event.data.action === 'show') {
        document.getElementById('pregnancy-test').style.display = 'flex';
        startLoading();
    }
});

function startLoading() {
    let loadingText = document.getElementById('loading-text');
    loadingText.style.display = 'block';

    // Simula o tempo de carregamento
    setTimeout(() => {
        hideLoadingAndShowResult();
    }, 3000); // 3 segundos de "carregamento"
}

function hideLoadingAndShowResult() {
    let loadingText = document.getElementById('loading-text');
    loadingText.style.display = 'none';

    showResult();
}

function showResult() {
    let result = document.getElementById('result');
    let testImage = document.getElementById('test-image');
    let isPositive = Math.random() < 0.5; // 50% de chance

    if (isPositive) {
        result.textContent = 'Positivo - 2 Traços!';
        testImage.src = 'testegravidapositivo.png';
    } else {
        result.textContent = 'Negativo - 1 Traço.';
        testImage.src = 'testegravidanegativo.png';
    }

    // Fecha o teste após 3 segundos
    setTimeout(() => {
        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });

        document.getElementById('pregnancy-test').style.display = 'none';
        testImage.src = 'testegravida.png'; // Reseta a imagem para o próximo uso
        result.textContent = '';
    }, 3000);
}