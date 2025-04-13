// Get overlay element
/*const overlay = document.getElementById('loadingOverlay');*/

//// Function to show overlay
//function showOverlay() {
//    overlay.style.display = 'flex';
//    // Auto-hide after 3 seconds (optional)
//    setTimeout(hideOverlay, 3000);
//}

//// Function to hide overlay
//function hideOverlay() {
//    overlay.style.display = 'none';
//}


//window.showOverlay = function () {
//    overlay.style.display = 'flex';
//    setTimeout(hideOverlay, 3000);
//};

//window.hideOverlay = function () {
//    overlay.style.display = 'none';
//};



document.addEventListener("DOMContentLoaded", function () {
    const overlay = document.getElementById('loadingOverlay');

    window.showOverlay = function () {
        overlay.style.display = 'flex';
       // setTimeout(hideOverlay, 3000);
    };

    window.hideOverlay = function () {
        overlay.style.display = 'none';
    };
});


