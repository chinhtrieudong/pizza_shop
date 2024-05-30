$(document).ready(function () {
    "use strict";
    // add active class to header
    const navElement = $("#navbarCollapse");
    const currentUrl = window.location.pathname;
    navElement.find('a.nav-link').each(function () {
        const link = $(this);
        const href = link.attr('href');

        if (currentUrl == href) {
            link.addClass('active');
        } else if (href == "/admin") {
            link.removeClass('active');
        }
    });
});
