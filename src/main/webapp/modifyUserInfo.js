document.addEventListener('DOMContentLoaded', function () {
    // Get all elements with class="modify_tablink" and attach click event
    const tabLinks = document.querySelectorAll('.modify_tablink');
    tabLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            openTab(event, this.getAttribute('onclick').split("'")[1]);
        });
    });
});

function openTab(event, tabName) {
    // Declare all variables
    let i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="modify_contents_right" and hide them
    modifyContentsRight = document.getElementsByClassName("modify_contents_right");
    for (i = 0; i < modifyContentsRight.length; i++) {
        modifyContentsRight[i].style.display = "none";
    }

    // Get all elements with class="modify_tablink" and remove the class "active"
    tablinks = document.getElementsByClassName("modify_tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}

// Default open first tab
document.querySelector('.modify_tablink').click();