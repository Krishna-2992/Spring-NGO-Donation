function openModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "block";
    document.body.style.overflow = "hidden";
    modal.scrollTop = 0;
}

function closeModal(modalId) {
    document.getElementById(modalId).style.display = "none";
    document.body.style.overflow = "auto";
}

function switchModal(closeModalId, openModalId) {
    console.log('switchmodal')
    console.log("closing: ", closeModal)
    console.log("opening: ", openModal)
    closeModal(closeModalId);
    setTimeout(() => {
        openModal(openModalId);
    }, 100);
}

// Close modal when clicking outside
window.onclick = function(event) {
    if (event.target.className === 'modal') {
        closeModal(event.target.id);
    }
}

// Prevent modal content clicks from bubbling
document.querySelectorAll('.modal-content').forEach(content => {
    content.onclick = function(event) {
        event.stopPropagation();
    }
});

// Close modal on escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        document.querySelectorAll('.modal').forEach(modal => {
            if (modal.style.display === 'block') {
                closeModal(modal.id);
            }
        });
    }
});