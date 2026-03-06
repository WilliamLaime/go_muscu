document.addEventListener("turbo:load", () => {
  document.querySelectorAll("[data-resume-card]").forEach((card) => {
    const btn = card.querySelector(".resume-toggle");
    if (!btn) return;

    const label = btn.querySelector(".resume-toggle__label");
    const targetSelector = btn.getAttribute("data-bs-target");
    const collapse = targetSelector ? document.querySelector(targetSelector) : null;
    if (!collapse) return;

    collapse.addEventListener("shown.bs.collapse", () => {
      card.classList.add("is-open");
      btn.setAttribute("aria-expanded", "true");
      if (label) label.textContent = "Voir moins";
    });

    collapse.addEventListener("hidden.bs.collapse", () => {
      card.classList.remove("is-open");
      btn.setAttribute("aria-expanded", "false");
      if (label) label.textContent = "Voir plus";
    });
  });
});
