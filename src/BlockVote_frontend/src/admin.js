document.addEventListener("DOMContentLoaded", () => {
    const pollForm = document.getElementById("poll-form");
    const candidatesContainer = document.getElementById("candidates-container");
    const addCandidateBtn = document.getElementById("add-candidate");
    const pollsKey = "polls"; // LocalStorage key for saved polls

    // Handle dynamic candidate addition
    addCandidateBtn.addEventListener("click", () => {
        const candidateInput = document.createElement("input");
        candidateInput.type = "text";
        candidateInput.className = "candidate-input";
        candidateInput.placeholder = "Candidate Name";
        candidatesContainer.appendChild(candidateInput);
    });

    // Handle form submission
    pollForm.addEventListener("submit", (event) => {
        event.preventDefault(); // Prevent page refresh

        // Get input values
        const pollTitle = document.getElementById("poll-title").value.trim();
        const votingDuration = document.getElementById("voting-duration").value.trim();
        const adminEmail = document.getElementById("admin-email").value.trim();
        const adminPhone = document.getElementById("admin-phone").value.trim();
        const adminPassword = document.getElementById("admin-password").value.trim();

        // Gather candidate names
        const candidateInputs = document.querySelectorAll(".candidate-input");
        const candidates = Array.from(candidateInputs)
            .map(input => input.value.trim())
            .filter(name => name); // Filter out empty names

        // Validation
        if (!pollTitle || !votingDuration || !adminEmail || !adminPhone || !adminPassword) {
            alert("Please fill out all fields.");
            return;
        }
        if (candidates.length < 2) {
            alert("Please add at least two candidates.");
            return;
        }

        // Save poll to localStorage
        const pollData = {
            title: pollTitle,
            duration: votingDuration,
            adminEmail,
            candidates,
        };
        const savedPolls = JSON.parse(localStorage.getItem(pollsKey)) || [];
        savedPolls.push(pollData);
        localStorage.setItem(pollsKey, JSON.stringify(savedPolls));

        // Success message
        alert(`Poll "${pollTitle}" has been created successfully!`);

        // Clear the form
        pollForm.reset();
        candidatesContainer.innerHTML = ""; // Clear dynamic candidates
    });
});