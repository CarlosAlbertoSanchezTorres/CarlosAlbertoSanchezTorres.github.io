$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$articlesDir = Join-Path $root "articulos"

if (-not (Test-Path $articlesDir)) {
  New-Item -ItemType Directory -Path $articlesDir | Out-Null
}

Get-ChildItem -Path $articlesDir -Filter "*.html" -File | Remove-Item -Force

$article = @{
  Number = 1
  Category = "Teoria contable"
  Date = "19/04/2026"
  Time = "21:43"
  ReadTime = "12 min de lectura"
  ShortTitle = "Teoria contable y normatividad"
  Title = "Entre la neutralidad imposible y la finalidad publica"
  FullTitle = "Entre la neutralidad imposible y la finalidad publica: limites de la teoria contable positiva y vigencia de la teoria normativa en los marcos conceptuales contemporaneos"
  Summary = "Articulo academico sobre los limites de la teoria contable positiva y la vigencia de la teoria normativa para la rendicion de cuentas, la sostenibilidad y el diseno de marcos conceptuales contemporaneos."
  Lead = "Este articulo examina criticamente la relacion entre teoria contable positiva y teoria contable normativa, argumentando que la primera, aunque util para explicar practicas y comportamientos, resulta insuficiente para fundamentar marcos conceptuales orientados a la rendicion de cuentas, la sostenibilidad y la regulacion publica."
  Focus = "La contabilidad aplicada necesita fines explicitos cuando busca accountability, sostenibilidad y diseno institucional."
  Keywords = @(
    "teoria contable positiva",
    "teoria contable normativa",
    "accountability",
    "sostenibilidad",
    "sector publico",
    "marcos conceptuales"
  )
  Sections = @(
    @{
      Heading = "Resumen"
      Paragraphs = @(
        "Este articulo examina criticamente la relacion entre teoria contable positiva y teoria contable normativa, argumentando que la primera, aunque util para explicar practicas y comportamientos, resulta insuficiente para fundamentar marcos conceptuales orientados a la rendicion de cuentas, la sostenibilidad y la regulacion publica.",
        "A partir de una revision de literatura basada exclusivamente en las fuentes proporcionadas, se sostiene que la contabilidad es una disciplina aplicada que necesariamente opera en relaciones medio-fin. En consecuencia, la teoria normativa, especialmente en su version condicional propuesta por Mattessich, sigue siendo indispensable para orientar el diseno de marcos conceptuales contemporaneos.",
        "El articulo analiza las tensiones entre neutralidad, utilidad para la decision y accountability, y concluye que esta ultima debe ocupar una posicion jerarquica superior en la construccion de estandares contables publicos y sostenibles."
      )
    },
    @{
      Heading = "1. Introduccion"
      Paragraphs = @(
        "Uno de los debates mas persistentes de la teoria contable moderna gira en torno a la legitimidad cientifica de la normatividad. Durante varias decadas, la teoria contable positiva aspiro a consolidarse como la via rigurosa del conocimiento contable, desplazando a la teoria normativa al terreno de lo presuntamente especulativo o valorativo.",
        "Sin embargo, esta pretension de neutralidad ha sido cuestionada por diversos autores, quienes sostienen que la contabilidad no puede operar como una ciencia pura, debido a que siempre esta vinculada con objetivos institucionales, politicos y sociales.",
        "La tesis central de este articulo sostiene que, aunque la teoria positiva aporto disciplina analitica y capacidad explicativa, sus pretensiones de neutralidad resultan insuficientes para fundamentar marcos conceptuales consistentes en contextos donde la contabilidad cumple funciones de rendicion de cuentas, sostenibilidad y diseno institucional."
      )
    },
    @{
      Heading = "2. Teoria positiva, teoria normativa y contabilidad aplicada"
      Paragraphs = @(
        "Richard Mattessich distinguio entre la investigacion empirica en general y la teoria contable positiva en sentido estricto. Para el, la teoria positiva no equivale a toda investigacion basada en hechos, sino a una postura que pretende excluir normas y juicios de valor del marco teorico.",
        "Frente a ello, defendio una teoria condicional-normativa, que no busca imponer fines arbitrarios, sino identificar los medios mas eficientes para alcanzar fines explicitos.",
        "Esta posicion parte de entender la contabilidad como una disciplina aplicada. Sus artefactos y procedimientos estan disenados para cumplir propositos concretos, tales como stewardship, accountability o utilidad para la decision."
      )
    },
    @{
      Heading = "3. Critica a la neutralidad de la teoria positiva"
      Paragraphs = @(
        "El principal merito de la teoria positiva fue exigir contrastacion empirica y cuestionar normativismos ingenuos. No obstante, de ello no se sigue que la solucion sea expulsar los fines del marco teorico.",
        "Toda seleccion de variables, criterios de exito y usuarios relevantes presupone una determinada finalidad. La aparente neutralidad de la teoria positiva resulta problematica porque incluso los modelos centrados en utilidad para la decision implican una eleccion previa sobre que actores importan y que informacion debe privilegiarse.",
        "La teoria positiva puede explicar por que determinadas practicas contables existen, pero no basta para determinar si esas practicas son adecuadas desde el punto de vista social, etico o institucional."
      )
    },
    @{
      Heading = "4. Sostenibilidad, accountability y marcos conceptuales"
      Paragraphs = @(
        "La literatura reciente sobre sostenibilidad y sector publico confirma la necesidad de recuperar la dimension normativa de la contabilidad. La teoria positiva permite identificar oportunidades y riesgos, pero no basta para resolver los vacios teoricos, empiricos y metodologicos de la sostenibilidad.",
        "En el sector publico ocurre algo similar: la accountability no debe ser entendida como un efecto secundario de la informacion financiera, sino como el principio organizador del sistema contable.",
        "Esto implica que la contabilidad publica no puede orientarse solamente a la utilidad para la decision, sino que debe priorizar la rendicion de cuentas frente a ciudadanos, contribuyentes y organismos de control."
      )
    },
    @{
      Heading = "5. Contraargumentos"
      Paragraphs = @(
        "Los defensores de la teoria positiva suelen senalar que muchas teorias normativas tradicionales carecian de evidencia empirica suficiente y se apoyaban en supuestos debiles. Esta critica es parcialmente valida, ya que varios enfoques normativos ocultaban sus objetivos o no explicitaban adecuadamente sus supuestos.",
        "Otro argumento relevante es que las mediciones basadas en datos observables pueden reducir arbitrariedades. Sin embargo, incluso este enfoque sigue siendo normativo, ya que prescribe que mediciones deberian usarse y por que.",
        "Por tanto, el problema no es la existencia de normatividad, sino la ausencia de una normatividad explicita y bien fundamentada."
      )
    },
    @{
      Heading = "6. Conclusion"
      Paragraphs = @(
        "La oposicion entre teoria contable positiva y teoria normativa ha perdido parte de su fuerza explicativa. La evidencia revisada muestra que la teoria positiva fue util para exigir rigor empirico, pero no logro proporcionar una base suficiente para la construccion de marcos conceptuales orientados a la rendicion de cuentas y la sostenibilidad.",
        "La contabilidad, en cuanto disciplina aplicada, necesita integrar hechos, objetivos y valores. Por ello, la propuesta de Mattessich de una teoria condicional-normativa sigue siendo especialmente relevante.",
        "En contextos publicos y sostenibles, accountability debe ocupar una posicion jerarquica superior frente a la mera utilidad para la decision. Solo asi los marcos conceptuales podran responder adecuadamente a las responsabilidades economicas, sociales y politicas de la contabilidad contemporanea."
      )
    }
  )
  References = @(
    "Anomah, S., Latif Frimpong, J., & Moaweni, F. (2025). From manual to digital: The evolution of accounting theory in the age of accounting Information Systems. EDPACS, 70(12), 26-52. https://doi.org/10.1080/07366981.2025.2513101",
    "Archer, S. (1998). Mattessich's Critique of Accounting: A review article. Accounting and Business Research, 28(4), 297-316. https://doi.org/10.1080/00014788.1998.9728917",
    "Hien, N. T. T., Hai, P. H., Bui, T. T. T., & Tuan, D. A. (2025). Structural equation modeling of factors affecting accountability-based accounting in public sector entities. Emerging Science Journal, 9(4), 2162-2178. https://doi.org/10.28991/ESJ-2025-09-04-023",
    "Mann, B., Lorson, P. C., Oulasvirta, L., & Haustein, E. (2019). The quest for a primary EPSAS purpose: insights from literature and conceptual frameworks. Accounting in Europe, 16(2), 195-218. https://doi.org/10.1080/17449480.2019.1632467",
    "Mattessich, R. (1992). On the history of normative accounting theory: Paradigm lost, paradigm regained? Accounting, Business & Financial History, 2(2), 181-198. https://doi.org/10.1080/09585209200000039",
    "Miller, P. B. W., & Bahnson, P. R. (2010). Continuing the normative dialog: Illuminating the asset/liability theory. Accounting Horizons, 24(3), 419-440. https://doi.org/10.2308/acch.2010.24.3.419",
    "Zyznarska-Dworczak, B. (2020). Sustainability accounting-Cognitive and conceptual approach. Sustainability, 12(23), 9936. https://doi.org/10.3390/su12239936"
  )
}

$questionList = ($article.Keywords | ForEach-Object { "          <li>$_</li>" }) -join "`n"
$sectionBlocks = ($article.Sections | ForEach-Object {
  $paragraphs = ($_.Paragraphs | ForEach-Object { "        <p>$_</p>" }) -join "`n"
@"
        <h2>$($_.Heading)</h2>
$paragraphs
"@
}) -join "`n`n"
$referencesList = ($article.References | ForEach-Object { "          <li>$_</li>" }) -join "`n"

$articlePage = @"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$($article.FullTitle) | Carlos Alberto Sanchez Torres</title>
  <meta
    name="description"
    content="$($article.Summary)"
  />
  <meta name="author" content="Carlos Alberto Sanchez Torres" />
  <link rel="stylesheet" href="../style.css" />
</head>
<body>
  <header>
    <div class="container">
      <nav>
        <div class="brand">Carlos Alberto Sanchez Torres</div>
        <div class="nav-links">
          <a href="../index.html">Inicio</a>
          <a href="../index.html#articulos">Articulos</a>
          <a href="../index.html#contacto">Contacto</a>
        </div>
      </nav>

      <div class="hero">
        <div>
          <span class="tag">$($article.Category)</span>
          <h1>$($article.FullTitle)</h1>
          <p>$($article.Summary)</p>
        </div>

        <div class="hero-card">
          <h2>Entrada $($article.Number)</h2>
          <p><strong>Fecha:</strong> $($article.Date)</p>
          <p><strong>Hora:</strong> $($article.Time)</p>
          <p class="quote">$($article.Focus)</p>
        </div>
      </div>
    </div>
  </header>

  <main>
    <div class="container">
      <section class="panel article-content">
        <a class="back-link" href="index.html">Ver todos los articulos</a>

        <div class="post-meta">Entrada $($article.Number) - $($article.Category) - $($article.Date) - $($article.Time)</div>

        <p class="article-intro">$($article.Lead)</p>

        <h2>Palabras clave</h2>
        <ul>
$questionList
        </ul>

$sectionBlocks

        <h2>Referencias</h2>
        <ul>
$referencesList
        </ul>
      </section>
    </div>
  </main>

  <footer>
    <div class="container">
      Copyright 2026 Carlos Alberto Sanchez Torres - Blog de Contabilidad
    </div>
  </footer>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $articlesDir "articulo-1.html"), $articlePage, [System.Text.UTF8Encoding]::new($false))

$archivePage = @"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Todos los articulos | Carlos Alberto Sanchez Torres</title>
  <meta
    name="description"
    content="Archivo completo de articulos de Carlos Alberto Sanchez Torres ordenado por entrada, con fecha y hora de publicacion."
  />
  <meta name="author" content="Carlos Alberto Sanchez Torres" />
  <link rel="stylesheet" href="../style.css" />
</head>
<body>
  <header>
    <div class="container">
      <nav>
        <div class="brand">Carlos Alberto Sanchez Torres</div>
        <div class="nav-links">
          <a href="../index.html">Inicio</a>
          <a href="../index.html#sobre">Sobre mi</a>
          <a href="../index.html#contacto">Contacto</a>
        </div>
      </nav>

      <div class="hero">
        <div>
          <span class="tag">Archivo completo</span>
          <h1>Todos los articulos</h1>
          <p>
            Esta pagina reune el archivo disponible del blog en orden de entrada, con fecha y hora de publicacion.
          </p>
        </div>

        <div class="hero-card">
          <h2>Orden editorial</h2>
          <p>Los articulos estan organizados desde la Entrada 1 en adelante.</p>
          <p class="quote">Cada registro muestra su fecha y hora para conservar el orden exacto del archivo.</p>
        </div>
      </div>
    </div>
  </header>

  <main>
    <div class="container">
      <section class="panel">
        <a class="back-link" href="../index.html#articulos">Volver al inicio</a>
        <h2 class="section-title">Archivo de articulos</h2>
        <p class="muted">1 publicacion ordenada por numero de entrada, fecha y hora.</p>
        <div class="archive-toolbar">
          <label class="search-field" for="article-search">
            <span>Buscar en el archivo</span>
            <input id="article-search" type="search" placeholder="Titulo, categoria, resumen o numero de entrada" />
          </label>
          <div class="archive-meta">
            <p id="results-summary" class="results-summary">Mostrando 1-1 de 1 articulos</p>
            <p class="muted">Orden fijo por entrada editorial</p>
          </div>
        </div>
        <div class="articles-list">
          <article class="card article-card archive-item" data-entry="1" data-search="entrada 1 $($article.Category) $($article.FullTitle) $($article.Summary)">
            <div class="post-meta">Entrada 1 - $($article.Category)</div>
            <h3>$($article.FullTitle)</h3>
            <p>$($article.Summary)</p>
            <p class="post-datetime">$($article.Date) - $($article.Time)</p>
            <a href="articulo-1.html">Leer articulo completo</a>
          </article>
        </div>
        <div class="pagination" aria-label="Paginacion del archivo">
          <button id="prev-page" class="pagination-button" type="button">Anterior</button>
          <div id="page-numbers" class="page-numbers"></div>
          <button id="next-page" class="pagination-button" type="button">Siguiente</button>
        </div>
      </section>
    </div>
  </main>

  <footer>
    <div class="container">
      Copyright 2026 Carlos Alberto Sanchez Torres - Blog de Contabilidad
    </div>
  </footer>
  <script src="archive.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $articlesDir "index.html"), $archivePage, [System.Text.UTF8Encoding]::new($false))

$archiveScriptContent = @"
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
    resultsSummary.textContent = "No hay articulos que coincidan con la busqueda.";
    return;
  }

  const start = (currentPage - 1) * pageSize + 1;
  const end = Math.min(start + pageSize - 1, total);
  resultsSummary.textContent = `Mostrando ${start}-${end} de ${total} articulos`;
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
"@

[System.IO.File]::WriteAllText((Join-Path $articlesDir "archive.js"), $archiveScriptContent, [System.Text.UTF8Encoding]::new($false))
