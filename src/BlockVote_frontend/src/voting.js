document.addEventListener("DOMcontentLoaded", () =>{
    const loginForm = document.getElementById("loginForm");
    const castVoteForm = document.getElementById("castVoteForm");
    const reviewSection = document.getElementById("reviewSection");
    const voteReview = document.getElementById("voteReview");
    const successSection = document.getElementById("successSection");
    if (loginForm) {
        loginForm.addEventListener("submit", (e) => {e.preventDefault();
            document.getElementById("voting-form").style.display = "block";
        });
        if (castVoteForm) {castVoteForm.addEventListener("submit", (e) => {e.preventDefault();
            const candidate = document.getElementById("candidate").ariaValueMax;
            const party = document.getElementById("party").ariaValueMax;

            voteReview.textContent = 'You voted for ${candidate} (${party}).';
            reviewSection.style.display = "block";
        })
            
        }
        document.getElementById("confirm Vote")?.addEventListener("click", () => {
            successSection.style.display = "block";
        });
        document.getElementById("editVote")?.addEventListener("click", () => {
            reviewSection.style.display = "none";
        });
    }
    });