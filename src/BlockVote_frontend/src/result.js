document.addEventListener("DOMContentLoaded", () => {
    const results = [
        { name: "Asa Salisu", party: "Party A", votes: 120 },
        { name: "Abubakar Abdussalam", party: "Party B", votes: 99 },
        { name: "Abubakar Maison Kudi", party: "Party C", votes: 5 },
    ];

    const tbody = document.querySelector(".result-table tbody");
    results.forEach(result => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${result.name}</td>
            <td>${result.party}</td>
            <td>${result.votes}</td>
        `;
        tbody.appendChild(row);
    });
});