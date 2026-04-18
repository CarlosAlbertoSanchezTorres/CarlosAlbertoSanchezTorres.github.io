const items = Array.from(document.querySelectorAll(".archive-item"));
const searchInput = document.querySelector("#article-search");
const resultsSummary = document.querySelector("#results-summary");
const pageNumbers = document.querySelector("#page-numbers");
const prevButton = document.querySelector("#prev-page");
const nextButton = document.querySelector("#next-page");

const pageSize = 9;
let currentPage = 1;
let filteredItems = [...items];

function normalize(value) {
  return value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

function updateSummary(total) {
  if (!total) {
    resultsSummary.textContent = "No hay artículos que coincidan con la búsqueda.";
    return;
  }

  const start = (currentPage - 1) * pageSize + 1;
  const end = Math.min(start + pageSize - 1, total);
  resultsSummary.textContent = `Mostrando ${start}-${end} de ${total} artículos`;
}

function renderPagination(totalPages) {
  pageNumbers.innerHTML = "";

  if (totalPages <= 1) {
    prevButton.disabled = true;
    nextButton.disabled = true;
    return;
  }

  for (let page = 1; page <= totalPages; page += 1) {
    const button = document.createElement("button");
    button.type = "button";
    button.className = `pagination-button${page === currentPage ? " is-active" : ""}`;
    button.textContent = String(page);
    button.addEventListener("click", () => {
      currentPage = page;
      render();
    });
    pageNumbers.appendChild(button);
  }

  prevButton.disabled = currentPage === 1;
  nextButton.disabled = currentPage === totalPages;
}

function render() {
  const total = filteredItems.length;
  const totalPages = Math.max(1, Math.ceil(total / pageSize));

  if (currentPage > totalPages) {
    currentPage = totalPages;
  }

  const startIndex = (currentPage - 1) * pageSize;
  const visibleEntries = new Set(
    filteredItems.slice(startIndex, startIndex + pageSize).map((item) => item.dataset.entry)
  );

  items.forEach((item) => {
    const shouldShow = visibleEntries.has(item.dataset.entry);
    item.hidden = !shouldShow;
  });

  updateSummary(total);
  renderPagination(totalPages);
}

function applySearch() {
  const query = normalize(searchInput.value.trim());

  filteredItems = items.filter((item) => {
    const haystack = normalize(item.dataset.search || item.textContent || "");
    return haystack.includes(query);
  });

  currentPage = 1;
  render();
}

searchInput?.addEventListener("input", applySearch);

prevButton?.addEventListener("click", () => {
  if (currentPage > 1) {
    currentPage -= 1;
    render();
  }
});

nextButton?.addEventListener("click", () => {
  const totalPages = Math.max(1, Math.ceil(filteredItems.length / pageSize));
  if (currentPage < totalPages) {
    currentPage += 1;
    render();
  }
});

render();
