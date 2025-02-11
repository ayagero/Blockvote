// Toggle collapsible sections
function toggleSection(sectionId) {
    const section = document.getElementById(sectionId);
    const arrow = section.previousElementSibling.querySelector(".arrow");

    if (section.style.display === "block") {
        section.style.display = "none";
        arrow.textContent = "▼";
    } else {
        section.style.display = "block";
        arrow.textContent = "▲";
    }
}