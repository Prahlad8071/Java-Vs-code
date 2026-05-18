function modifyPage() {
  const walk = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
  let n;
  let completionDateNode = null;
  let dateValueNode = null;
  let historyHeaderNodes = [];

  while ((n = walk.nextNode())) {
    const normalizedText = n.nodeValue.replace(/\s+/g, ' ').trim();

    if (normalizedText === 'Exam Completion Date') {
      completionDateNode = n;
    }
    if (n.nodeValue.includes('May 8, 2026') && n.nodeValue.includes('12:15 IST')) {
      dateValueNode = n;
    }
    if (normalizedText.includes('Online Exam History')) {
      historyHeaderNodes.push(n);
    }
  }

  if (completionDateNode) {
    completionDateNode.nodeValue = 'Appointment';
  }

  historyHeaderNodes.forEach(node => {
    node.nodeValue = node.nodeValue.replace(/Online Exam History/gi, 'Exam Appointment History');
  });

  if (dateValueNode) {
    const parent = dateValueNode.parentElement;
    if (parent && !parent.hasAttribute('data-modified')) {
      parent.innerHTML = `
        <div style="margin-bottom: 4px;">Friday, May 8, 2026</div>
        <div style="margin-bottom: 12px;">Start time: 11:45 Asia/Kolkata - IST</div>
        <div style="font-weight: 700; margin-bottom: 4px; color: inherit; font-size: inherit;">Location</div>
        <div>Agilitics Edutech Pvt. Ltd - Noida Center</div>
      `;
      parent.setAttribute('data-modified', 'true');
    }
  }

  // Fallback for header if the text node approach missed it (e.g., due to inner HTML elements)
  document.querySelectorAll('h1, h2, h3, h4, div, span, p').forEach(el => {
    if (el.children.length === 0 && el.textContent.replace(/\s+/g, ' ').trim() === 'Online Exam History') {
      el.textContent = 'Exam Appointment History';
    }
  });
}

// Run immediately
modifyPage();

// Run periodically in case of dynamic content loading
setInterval(modifyPage, 1000);
