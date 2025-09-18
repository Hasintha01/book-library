function validateForm() {
    let title = document.forms["bookForm"]["title"].value;
    let author = document.forms["bookForm"]["author"].value;

    if (title == "" || author == "") {
        alert("Title and Author must be filled out");
        return false;
    }
    return true;
}
