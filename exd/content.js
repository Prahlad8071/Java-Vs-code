// content.js

const replacements = [
  { regex: /\b17 Mar\b/g, replacement: "8 May" },
  { regex: /\bMar 17\b/g, replacement: "May 8" },
  { regex: /\b17 March\b/g, replacement: "8 May" },
  { regex: /\bMarch 17\b/g, replacement: "May 8" },
  { regex: /\b17 Apr\b/g, replacement: "8 May" },
  { regex: /\bApr 17\b/g, replacement: "May 8" },
  { regex: /\b17 April\b/g, replacement: "8 May" },
  { regex: /\bApril 17\b/g, replacement: "May 8" },
  { regex: /\b14 Apr\b/g, replacement: "5 May" },
  { regex: /\bApr 14\b/g, replacement: "May 5" },
  { regex: /\b14 April\b/g, replacement: "5 May" },
  { regex: /\bApril 14\b/g, replacement: "May 5" }
];

function replaceText(node) {
  if (node.nodeType === Node.TEXT_NODE) {
    let originalText = node.nodeValue;
    let newText = originalText;

    for (let r of replacements) {
      newText = newText.replace(r.regex, r.replacement);
    }

    if (newText !== originalText) {
      node.nodeValue = newText;
    }
  } else if (node.nodeType === Node.ELEMENT_NODE) {
    // Avoid replacing text in script or style tags
    if (node.tagName === 'SCRIPT' || node.tagName === 'STYLE') {
      return;
    }

    // Also skip editable areas to avoid breaking user input
    if (node.isContentEditable || node.tagName === 'INPUT' || node.tagName === 'TEXTAREA') {
      return;
    }

    for (let child of node.childNodes) {
      replaceText(child);
    }
  }
}

// Initial replacement on load
replaceText(document.body);

// Use a MutationObserver to handle dynamically loaded content
const observer = new MutationObserver((mutations) => {
  for (let mutation of mutations) {
    if (mutation.type === 'childList') {
      for (let node of mutation.addedNodes) {
        replaceText(node);
      }
    } else if (mutation.type === 'characterData') {
      // If text node changed, check if it needs replacement
      let originalText = mutation.target.nodeValue;
      let newText = originalText;
      for (let r of replacements) {
        newText = newText.replace(r.regex, r.replacement);
      }
      if (newText !== originalText) {
        mutation.target.nodeValue = newText;
      }
    }
  }
});

observer.observe(document.body, {
  childList: true,
  subtree: true,
  characterData: true
});
