// DOM Elements
const detectBtn = document.getElementById('detect-btn');
const contentInput = document.getElementById('content-input');
const resultContainer = document.querySelector('.result-container');
const resultContent = document.querySelector('.result-content');
const loadingElement = document.querySelector('.loading');
const scoreValue = document.querySelector('.score-value');

// Circle progress setup
const circle = document.querySelector('.progress-ring-circle');
const radius = circle.r.baseVal.value;
const circumference = radius * 2 * Math.PI;
circle.style.strokeDasharray = `${circumference} ${circumference}`;
circle.style.strokeDashoffset = circumference;

// Event Listeners
detectBtn.addEventListener('click', handleDetection);

async function handleDetection() {
    const text = contentInput.value.trim();
    
    if (!text) {
        showError('Please enter text to analyze');
        return;
    }

    try {
        // Show loading state
        showLoading(true);
        
        const response = await fetch('/api/detect', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ input: text }),
        });

        if (!response.ok) {
            throw new Error('Server error');
        }

        const data = await response.json();
        console.log('Received data:', data);
        displayResult(data);

    } catch (error) {
        showError(error.message);
    } finally {
        showLoading(false);
    }
}

function displayResult(data) {
    // Show result container
    resultContainer.style.display = 'block';
    resultContent.style.display = 'block';
    
    // Update the percentage display
    const percentage = parseInt(data.percentage);
    scoreValue.textContent = `${percentage}%`;
    setProgress(percentage);

    // Update the detection badge
    const detectionBadge = document.querySelector('.detection-badge');
    detectionBadge.className = 'detection-badge'; // Reset classes
    detectionBadge.textContent = data.type;
    detectionBadge.classList.add(data.type.toLowerCase());

    // Mise à jour du label de probabilité
    const scoreLabel = document.querySelector('.score-label');
    if (data.type === 'AI') {
        scoreLabel.textContent = 'AI Probability'; // Si le type est AI
    } else if (data.type === 'HUMAN') {
        scoreLabel.textContent = 'Human Probability'; // Si le type est Human
    }
}

function setProgress(percent) {
    const offset = circumference - (percent / 100 * circumference);
    circle.style.strokeDashoffset = offset;
    
    // Set color based on the type
    const type = document.querySelector('.detection-badge').textContent;
    circle.style.stroke = type === 'AI' ? '#ff4444' : '#00C851';
}

function showLoading(show) {
    detectBtn.disabled = show;
    loadingElement.style.display = show ? 'block' : 'none';
    resultContent.style.display = show ? 'none' : 'block';
}

function showError(message) {
    resultContainer.style.display = 'block';
    resultContent.style.display = 'none';
    loadingElement.innerHTML = `
        <div class="error">
            <h3>⚠️ Error</h3>
            <p>${message}</p>
        </div>
    `;
    loadingElement.style.display = 'block';
}

// FAQ functionality
document.querySelectorAll('.faq-question').forEach(question => {
    question.addEventListener('click', () => {
        const faqItem = question.parentElement;
        const isActive = faqItem.classList.contains('active');
        
        // Close all FAQ items
        document.querySelectorAll('.faq-item').forEach(item => {
            item.classList.remove('active');
        });
        
        // Open clicked item if it wasn't active
        if (!isActive) {
            faqItem.classList.add('active');
        }
    });
});

// Menu toggle
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');
menuToggle.addEventListener('click', () => navLinks.classList.toggle('active'));
