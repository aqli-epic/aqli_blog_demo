const currentPath = window.location.pathname;

document.querySelectorAll(".nav-links a").forEach((link) => {
  const linkPath = new URL(link.href).pathname;
  if (currentPath === linkPath) {
    link.setAttribute("aria-current", "page");
  }
});
