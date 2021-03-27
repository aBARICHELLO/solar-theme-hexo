package blog.themes.solar.source.hx;

import js.Browser.window;
import js.Browser.document;

function onscroll() {
    var z = document.querySelector(".banner")
        .getBoundingClientRect()
        .bottom / (document.querySelector(".banner").getBoundingClientRect().bottom - document.querySelector(".banner").getBoundingClientRect().top);

    if (z < 0) {
        z = 0.001;
    }

    final wrapper = document.querySelector("#wrapper");
    wrapper.style.setProperty("transform", 'scale(${z})');

    //

    final menu = document.querySelector("#menu");
    final menuIcon = document.querySelector("#menu-icon");
    final menuIconTablet = document.querySelector("#menu-icon-tablet");
    final topDistance = window.scrollY;
    if (menu != null) {
        if (menu.style.visibility != "hidden" && topDistance < 10) {
            document.querySelector("#menu > #nav").style.display = "block";
        } else if (document.querySelector("#menu").style.visibility != "hidden" && topDistance > 10) {
            document.querySelector("#menu > #nav").style.display = "none";
        }
        if (menuIcon.style.visibility == "hidden" && topDistance < 10) {
            menuIconTablet.style.display = "block";
            document.querySelector("#top-icon-tablet").style.display = "none";
        } else if (menuIcon.style.visibility == "hidden" && topDistance > 10) {
            menuIconTablet.style.display = "none";
            document.querySelector("#top-icon-tablet").style.display = "block";
        }
    }

    //

    if (document.querySelector("#footer-post") != null) {
        var lastScrollTop = 0.0;
        final topDistance = window.scrollY;
        if (topDistance > lastScrollTop) {
            document.querySelector("#footer-post").style.display = "none";
        } else {
            document.querySelector("#footer-post").style.display = "block";
        }
        lastScrollTop = topDistance;
        document.querySelector("#nav-footer").style.display = "none";
        document.querySelector("#toc-footer").style.display = "none";
        document.querySelector("#share-footer").style.display = "none";
        if (topDistance < 50) {
            document.querySelector("#actions-footer > ul > #top").style.display = "none";
            document.querySelector("#actions-footer > ul > #menu").style.display = "block";
        } else if (topDistance > 100) {
            document.querySelector("#actions-footer > ul > #menu").style.display = "none";
            document.querySelector("#actions-footer > ul > #top").style.display = "block";
        }
    }
}

function onready() {
    final menu = document.querySelector("#menu");
    final menuIcon = document.querySelector("#menu-icon");
    final menuIconTablet = document.querySelector("#menu-icon-tablet");
    final items = [
        menuIcon,
        menuIconTablet
    ];
    if (menuIcon != null && menuIconTablet != null) {
        for (el in items) {
            el.onclick = () -> {
                final menunav = document.querySelector("#menu > #nav");
                if (menu.style.visibility == "hidden") {
                    menu.style.visibility = "visible";
                    el.classList.add("active");
                    menunav.style.visibility = "visible";
                    return "none";
                } else {
                    menu.style.visibility = "hidden";
                    menunav.style.visibility = "hidden";
                    el.classList.remove("active");
                    return "none";
                }
            };
        }
    }
}

function main() {
    window.onscroll = onscroll;
    document.addEventListener("DOMContentLoaded", onready);
}
