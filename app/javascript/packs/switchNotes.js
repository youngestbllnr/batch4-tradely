window.switchNotes = switchNotes;

function switchNotes() {
    let notes = document.getElementsByClassName("note");
    if (notes.length == 2) {
        if (notes[0].style.display == "block") {
            setTimeout(function() {
                notes[0].style.display = "none";
                notes[1].style.display = "block";
            }, 1000);
        } else {
            notes[0].style.display = "block";
            notes[1].style.display = "none";
        }
    }
}