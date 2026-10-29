/* Color-vision teaching demo. No entered data is sent, logged or persisted. */
(() => {
  "use strict";

  const STORAGE_KEY = "accessible-rails-color-vision-v1";
  const DEFAULTS = Object.freeze({ simulation: "original", palette: "current", layout: "comparison", cues: "words", single: "simulated", dialog: "original" });
  const OPTIONS = Object.freeze({
    simulation: ["original", "protanopia", "deuteranopia", "tritanopia"],
    palette: ["current", "distinct", "contrast"], layout: ["comparison", "single"],
    cues: ["color", "words"], single: ["original", "simulated"], dialog: ["original", "simulated"]
  });
  const TITLES = { original: "Original", protanopia: "Protanopia", deuteranopia: "Deuteranopia", tritanopia: "Tritanopia" };
  const EXPLANATIONS = {
    original: "Original shows unfiltered colors. Choose a simulation to approximate a different color-vision response.",
    protanopia: "Protanopia: a full-severity approximation of absent red-sensitive cone responses. Some red–green distinctions and the apparent brightness of reds can change. Individual experience varies.",
    deuteranopia: "Deuteranopia: a full-severity approximation of absent green-sensitive cone responses. Some red–green distinctions can become difficult to separate. Individual experience varies.",
    tritanopia: "Tritanopia: a limited blue–yellow approximation associated with blue-sensitive cone differences. This model’s blue–yellow transform does not exactly reproduce tritanopia; treat this setting as an illustration, not a precise representation."
  };
  const PALETTES = {
    current: "The current palette uses the showcase’s original colors. Check that text, controls and boundaries remain clear when colors become harder to distinguish.",
    distinct: "The distinct-color palette uses blue, orange and purple as an alternative to familiar red–green status colors. Some hues can still converge in a simulation. Keep the status words and icons to preserve meaning.",
    contrast: "The high-contrast palette uses a light surface, dark text, strong borders and dark controls. Contrast supports readability; words and icons still carry status meaning when hues look similar."
  };

  function initialize() {
    document.querySelectorAll("[data-color-vision]").forEach((root) => {
      if (root.dataset.cvReady) return;
      const find = (selector) => root.querySelector(selector);
      const all = (selector) => Array.from(root.querySelectorAll(selector));
      const settings = { ...DEFAULTS };
      let canRemember = true;
      let opener = null;
      const dialog = find("[data-cv-dialog]");
      const inputs = all("[data-cv-form] input");
      const announcement = find("[data-cv-announcement]");
      const buttonStates = { save: false, cancel: false, delete: false };

      try {
        const stored = localStorage.getItem(STORAGE_KEY);
        let saved = null;
        try { saved = JSON.parse(stored || "null"); } catch (_) { /* Ignore damaged display settings. */ }
        if (saved && typeof saved === "object" && !Array.isArray(saved)) {
          Object.keys(DEFAULTS).forEach((key) => {
            if (OPTIONS[key].includes(saved[key])) settings[key] = saved[key];
          });
        }
      } catch (_) { canRemember = false; }

      function storageNote() {
        find("[data-cv-storage]").textContent = canRemember
          ? "Display choices stay in this browser. Email text is never stored."
          : "Browser storage is unavailable. Display choices last for this page only; email text is never stored.";
      }
      function remember() {
        try { localStorage.setItem(STORAGE_KEY, JSON.stringify(settings)); canRemember = true; }
        catch (_) { canRemember = false; }
        storageNote();
      }
      function filter(surface, simulated) {
        surface.style.filter = simulated && settings.simulation !== "original"
          ? `url("#cv-${settings.simulation}")` : "none";
      }
      function render(announce = false) {
        all("[data-cv-setting]").forEach((input) => {
          input.checked = settings[input.dataset.cvSetting] === input.value;
        });
        all("[data-cv-palette]").forEach((surface) => { surface.dataset.cvPalette = settings.palette; });
        root.dataset.cvCues = settings.cues;
        find("[data-cv-panels]").dataset.layout = settings.layout;
        find("[data-cv-reference]").hidden = settings.layout === "single";
        find("[data-cv-single-controls]").hidden = settings.layout !== "single";
        const simulated = settings.layout === "comparison" || settings.single === "simulated";
        const isFiltered = simulated && settings.simulation !== "original";
        filter(find("[data-cv-comparison]"), simulated);
        filter(find("[data-cv-dialog-surface]"), settings.dialog === "simulated");
        find("[data-cv-heading]").textContent = isFiltered
          ? `${settings.layout === "comparison" ? "Comparison" : "Single demo"} — ${TITLES[settings.simulation]}`
          : `${settings.layout === "comparison" ? "Comparison" : "Single demo"} — original colors`;
        find("[data-cv-comparison-note]").textContent = settings.simulation === "original"
          ? "Choose a simulation to compare it with the original."
          : isFiltered ? "Approximate simulation; the selected palette and interactions match the reference."
          : "Unfiltered view of the selected palette. Switch to Simulated to see the selected approximation.";
        find("[data-cv-explanation]").textContent = EXPLANATIONS[settings.simulation];
        find("[data-cv-palette-explanation]").textContent = PALETTES[settings.palette];
        find("[data-cv-dialog-description]").textContent = settings.dialog === "simulated" && settings.simulation !== "original"
          ? `${TITLES[settings.simulation]} approximation with the selected palette.` : "Original colors with the selected palette.";
        find(".cv-swipe-hint").hidden = settings.layout !== "comparison";
        find("[data-cv-scroll]").setAttribute("aria-describedby", settings.layout === "comparison" ? "cv-scroll-hint" : "");
        if (announce) {
          const paletteLabel = { current: "Current", distinct: "Distinct-color", contrast: "High-contrast" }[settings.palette];
          announcement.textContent = `${TITLES[settings.simulation]} selected. ${paletteLabel} palette. ${settings.layout === "comparison" ? "Side-by-side comparison" : "Single demo"}. ${settings.cues === "words" ? "Status words and icons shown" : "Visible status uses color only"}.`;
        }
      }
      function clearValidation() {
        all("[data-cv-validation]").forEach((message) => { message.hidden = true; message.textContent = ""; delete message.dataset.state; });
        inputs.forEach((input) => {
          input.removeAttribute("aria-invalid");
          input.setAttribute("aria-describedby", `${input.id}-hint`);
        });
        announcement.textContent = "";
      }
      function validate() {
        const valid = inputs[0].checkValidity();
        const text = valid ? "Valid email format. This practice address was not sent or saved."
          : "Invalid email format. Enter an address such as name@example.com.";
        all("[data-cv-form]").forEach((form) => {
          const input = form.querySelector("input");
          const message = form.querySelector("[data-cv-validation]");
          message.hidden = false;
          message.textContent = text;
          message.dataset.state = valid ? "valid" : "invalid";
          input.setAttribute("aria-invalid", String(!valid));
          input.setAttribute("aria-describedby", `${input.id}-hint ${message.id}`);
        });
        // One live region avoids duplicated announcements from the paired views.
        announcement.textContent = text;
      }
      all("[data-cv-setting]").forEach((input) => input.addEventListener("change", () => {
        const key = input.dataset.cvSetting;
        if (!OPTIONS[key] || !OPTIONS[key].includes(input.value)) return;
        settings[key] = input.value;
        render(true);
        remember();
      }));
      inputs.forEach((input) => {
        input.autocomplete = "off";
        input.addEventListener("input", () => {
          inputs.forEach((other) => { if (other !== input) other.value = input.value; });
          clearValidation();
        });
        input.addEventListener("keydown", (event) => {
          if (event.key === "Enter") { event.preventDefault(); validate(); }
        });
      });
      all("[data-cv-validate]").forEach((button) => button.addEventListener("click", validate));
      all("[data-cv-button]").forEach((button) => {
        const key = button.dataset.cvButton;
        button.addEventListener("click", () => {
          buttonStates[key] = !buttonStates[key];
          all(`[data-cv-button="${key}"]`).forEach((other) => other.setAttribute("aria-pressed", String(buttonStates[key])));
        });
        button.addEventListener("focus", () => all(`[data-cv-button="${key}"]`).forEach((other) => other.classList.add("cv-mirrored-focus")));
        button.addEventListener("blur", () => all(".cv-mirrored-focus").forEach((other) => other.classList.remove("cv-mirrored-focus")));
      });
      all("[data-cv-open-dialog]").forEach((button) => button.addEventListener("click", () => {
        opener = button;
        if (!dialog.open) dialog.showModal();
      }));
      all("[data-cv-close-dialog]").forEach((button) => button.addEventListener("click", () => dialog.close()));
      dialog.addEventListener("close", () => { if (opener && opener.isConnected) opener.focus(); });
      dialog.addEventListener("keydown", (event) => {
        if (event.key !== "Tab" || !dialog.open) return;
        const focusable = Array.from(dialog.querySelectorAll('button, input, select, textarea, a[href], [tabindex]'))
          .filter((control) => !control.disabled && control.tabIndex >= 0 && control.getClientRects().length > 0)
          .filter((control, _, controls) => control.type !== "radio" || !control.name ||
            !controls.some((other) => other.type === "radio" && other.name === control.name && other.checked) || control.checked);
        const first = focusable[0];
        const last = focusable[focusable.length - 1];
        if (!first) { event.preventDefault(); return; }
        if (event.shiftKey && (document.activeElement === first || !dialog.contains(document.activeElement))) {
          event.preventDefault(); last.focus();
        } else if (!event.shiftKey && (document.activeElement === last || !dialog.contains(document.activeElement))) {
          event.preventDefault(); first.focus();
        }
      });
      find("[data-cv-reset]").addEventListener("click", () => {
        Object.assign(settings, DEFAULTS);
        Object.keys(buttonStates).forEach((key) => { buttonStates[key] = false; });
        all("[data-cv-button]").forEach((button) => button.setAttribute("aria-pressed", "false"));
        inputs.forEach((input) => { input.value = ""; });
        clearValidation();
        find("[data-cv-scroll]").scrollLeft = 0;
        try { localStorage.removeItem(STORAGE_KEY); } catch (_) { canRemember = false; }
        render();
        storageNote();
        announcement.textContent = "Demo reset to the original side-by-side view, current palette, and status words and icons. Practice email cleared.";
      });
      // Clear browser-restored personal input; only allowlisted display choices persist.
      inputs.forEach((input) => { input.value = ""; });
      render();
      storageNote();
      all("[data-cv-setting], [data-cv-reset], [data-cv-validate]").forEach((control) => { control.disabled = false; });
      if (typeof dialog.showModal === "function") all("[data-cv-open-dialog]").forEach((control) => { control.disabled = false; });
      root.dataset.cvReady = "true";
    });
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", initialize);
  else initialize();
  document.addEventListener("turbo:load", initialize);
})();
