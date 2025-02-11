document.addEventListener("DOMContentLoaded", () => {
    const toggleButton =
    document.getElementById("toggleSidebar");
    const sidebar = document.getElementById("sidebar");
    const mainContent = document.querySelector(".main-content");
    toggleButton.addEventListener("click", () => {
        sidebar.classList.toggle("hidden");
        mainContent.classList.toggle("full-width");
    })
})