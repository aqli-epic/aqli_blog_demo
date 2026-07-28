(function () {
  "use strict";

  /* Mobile navigation */
  var navToggle = document.querySelector(".nav-toggle");
  var navLinks = document.querySelector(".main-nav__links");

  if (navToggle && navLinks) {
    navToggle.addEventListener("click", function () {
      var isOpen = navToggle.getAttribute("aria-expanded") === "true";
      navToggle.setAttribute("aria-expanded", String(!isOpen));
      navLinks.classList.toggle("is-open", !isOpen);
    });
  }

  /* Client-side filtering of story cards. Each card carries a data-search
     haystack built in post-card.html from title, standfirst, author, place,
     section and tags. The search box itself is hidden until the `js` class is
     set, so a reader without JavaScript is never shown a control that cannot
     do anything. */
  var inputs = document.querySelectorAll("[data-post-search]");

  Array.prototype.forEach.call(inputs, function (input) {
    var scope = input.closest(".section") || document;
    var cards = scope.querySelectorAll("[data-post-card]");
    var empty = scope.querySelector("[data-empty-state]");

    input.addEventListener("input", function () {
      var query = input.value.trim().toLowerCase();
      var visible = 0;

      Array.prototype.forEach.call(cards, function (card) {
        var haystack = card.getAttribute("data-search") || "";
        var match = !query || haystack.indexOf(query) !== -1;
        card.hidden = !match;
        if (match) visible += 1;
      });

      if (empty) empty.hidden = visible !== 0;
    });
  });
})();
