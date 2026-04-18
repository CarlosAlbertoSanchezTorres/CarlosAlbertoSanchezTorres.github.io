$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$articlesDir = Join-Path $root "articulos"

if (-not (Test-Path $articlesDir)) {
  New-Item -ItemType Directory -Path $articlesDir | Out-Null
}

$articles = @(
  @{ Number = 1; Category = "Teoría contable"; Date = [datetime]"2026-02-01T08:00:00"; Title = "¿Qué es realmente la contabilidad?"; Summary = "Una introducción al concepto de contabilidad como disciplina, lenguaje, sistema de información y construcción teórica."; Lead = "La contabilidad no puede reducirse a un simple mecanismo de registro. Su desarrollo histórico y conceptual muestra que se trata de una disciplina que organiza la realidad económica mediante criterios de reconocimiento, medición y comunicación."; Focus = "Este artículo abre el archivo del blog con una pregunta básica pero decisiva: qué entendemos por contabilidad cuando pensamos en su sentido académico."; Questions = @("¿Por qué la contabilidad es más que una técnica de registro?", "¿Qué papel cumple como lenguaje económico?", "¿Cómo se relaciona con la toma de decisiones?") },
  @{ Number = 2; Category = "Historia"; Date = [datetime]"2026-02-02T08:35:00"; Title = "Breve panorama de la evolución de la teoría contable"; Summary = "Un recorrido por algunas etapas clave del pensamiento contable y sus transformaciones principales."; Lead = "La teoría contable ha cambiado con las necesidades sociales, económicas e institucionales de cada época. Por eso conviene verla como una conversación histórica y no como un cuerpo cerrado de reglas."; Focus = "La revisión muestra cómo distintos autores y escuelas han intentado explicar el objeto, la función y el alcance de la contabilidad."; Questions = @("¿Qué etapas pueden identificarse en la teoría contable?", "¿Qué cambió con la contabilidad moderna?", "¿Por qué sigue siendo útil mirar hacia atrás?") },
  @{ Number = 3; Category = "Formación profesional"; Date = [datetime]"2026-02-03T09:10:00"; Title = "Cómo estudiar contabilidad con mayor profundidad"; Summary = "Estrategias para leer mejor, construir criterio técnico y desarrollar una formación contable más sólida."; Lead = "Estudiar contabilidad en serio implica desarrollar hábitos intelectuales, no solo memorizar normas o procedimientos. La profundidad se alcanza cuando el estudiante conecta práctica, teoría y lectura crítica."; Focus = "La formación rigurosa surge de la constancia, la lectura comparada y la capacidad de formular buenas preguntas."; Questions = @("¿Cómo organizar un plan de estudio sostenible?", "¿Qué tipo de lecturas fortalecen el criterio contable?", "¿Qué diferencia el aprendizaje superficial del aprendizaje profundo?") },
  @{ Number = 4; Category = "Información financiera"; Date = [datetime]"2026-02-04T09:45:00"; Title = "La utilidad de la información financiera para distintos usuarios"; Summary = "Una revisión del valor que tiene la información contable para inversionistas, administradores, acreedores y ciudadanos."; Lead = "No todos los usuarios leen los estados financieros con el mismo propósito. Cada grupo interpreta la información desde intereses, responsabilidades y horizontes temporales diferentes."; Focus = "Comprender esa diversidad ayuda a producir y analizar información más relevante."; Questions = @("¿Qué buscan los distintos usuarios?", "¿Cómo cambia la interpretación según el contexto?", "¿Qué tensiones aparecen entre utilidad y comparabilidad?") },
  @{ Number = 5; Category = "Teoría contable"; Date = [datetime]"2026-02-05T10:20:00"; Title = "El problema del reconocimiento contable"; Summary = "Reflexión sobre los criterios que permiten decidir cuándo un hecho económico debe reconocerse contablemente."; Lead = "Reconocer un hecho económico no es un acto neutral. Supone elegir reglas y criterios para decidir qué entra al sistema contable y qué queda por fuera."; Focus = "Detrás del reconocimiento hay supuestos teóricos sobre control, medición y relevancia."; Questions = @("¿Qué significa reconocer un hecho económico?", "¿Cuáles criterios suelen aplicarse?", "¿Qué riesgos tiene un reconocimiento inadecuado?") },
  @{ Number = 6; Category = "Historia"; Date = [datetime]"2026-02-06T10:55:00"; Title = "Luca Pacioli y el legado de la partida doble"; Summary = "El valor histórico y conceptual del método de partida doble en la consolidación de la contabilidad moderna."; Lead = "La figura de Luca Pacioli suele aparecer como punto de referencia obligado en la historia de la contabilidad. Más allá del mito, su obra permite pensar cómo se consolidó una técnica capaz de ordenar operaciones complejas."; Focus = "El sistema de partida doble no solo resolvió un problema práctico: cambió la forma de representar la actividad económica."; Questions = @("¿Por qué Pacioli es una referencia central?", "¿Qué aportó la partida doble?", "¿Qué límites tiene una lectura exclusivamente técnica de su legado?") },
  @{ Number = 7; Category = "Lecturas y reseñas"; Date = [datetime]"2026-02-07T11:30:00"; Title = "Por qué leer teoría contable hoy"; Summary = "Argumentos para incorporar lecturas teóricas en la formación de estudiantes y profesionales contables."; Lead = "En muchos programas académicos la teoría contable se percibe como un complemento abstracto. Sin embargo, prescindir de ella debilita la capacidad de interpretar normas, juzgar situaciones nuevas y participar en debates de fondo."; Focus = "La teoría contable fortalece la comprensión de la práctica y evita una formación puramente mecánica."; Questions = @("¿Qué aporta la teoría a la práctica?", "¿Cómo elegir textos teóricos iniciales?", "¿Por qué la lectura crítica sigue siendo necesaria?") },
  @{ Number = 8; Category = "Educación contable"; Date = [datetime]"2026-02-08T12:05:00"; Title = "Errores comunes al aprender contabilidad"; Summary = "Una guía para identificar hábitos que dificultan el aprendizaje y cómo corregirlos a tiempo."; Lead = "Buena parte de las dificultades en contabilidad provienen de hábitos de estudio poco eficaces: estudiar solo para exámenes, repetir procedimientos sin comprenderlos o depender de resúmenes simplificados."; Focus = "Detectar esos errores temprano permite construir una base más segura."; Questions = @("¿Qué prácticas de estudio suelen fallar?", "¿Cómo combinar ejercicios y comprensión conceptual?", "¿Qué tipo de seguimiento mejora el progreso?") },
  @{ Number = 9; Category = "Investigación"; Date = [datetime]"2026-02-09T12:40:00"; Title = "Cómo formular una pregunta de investigación en contabilidad"; Summary = "Claves para convertir un interés general en un problema de investigación claro y viable."; Lead = "Investigar en contabilidad exige delimitar el problema con precisión. Una buena pregunta no surge solo del entusiasmo por un tema: requiere contexto bibliográfico, pertinencia y alcance manejable."; Focus = "La calidad de la investigación depende en gran medida de cómo se formula la pregunta inicial."; Questions = @("¿Qué características debe tener una buena pregunta?", "¿Cómo acotar un tema amplio?", "¿Qué papel cumple la revisión bibliográfica?") },
  @{ Number = 10; Category = "Normas"; Date = [datetime]"2026-02-10T13:15:00"; Title = "Norma y juicio profesional en la práctica contable"; Summary = "Una reflexión sobre la relación entre la aplicación normativa y el criterio profesional."; Lead = "Las normas buscan orientar decisiones y promover consistencia, pero no eliminan la necesidad de juicio profesional. En la práctica, muchas situaciones exigen interpretar, ponderar y justificar."; Focus = "El valor del profesional no está solo en conocer la norma, sino en saber aplicarla con criterio."; Questions = @("¿Dónde termina la regla y empieza el juicio?", "¿Cómo justificar decisiones complejas?", "¿Qué formación fortalece el criterio profesional?") },
  @{ Number = 11; Category = "Teoría contable"; Date = [datetime]"2026-02-11T13:50:00"; Title = "Activos, pasivos y patrimonio: una lectura conceptual"; Summary = "Revisión de categorías básicas para entender su significado más allá de las definiciones operativas."; Lead = "Los conceptos de activo, pasivo y patrimonio suelen enseñarse desde fórmulas de clasificación. Pero su comprensión profunda requiere examinar qué representan y cómo se relacionan con la estructura económica de una entidad."; Focus = "Estas categorías son el núcleo del lenguaje contable y condicionan el análisis posterior."; Questions = @("¿Qué expresa realmente un activo?", "¿Cómo se entiende un pasivo desde la teoría?", "¿Qué papel cumple el patrimonio?") },
  @{ Number = 12; Category = "Historia"; Date = [datetime]"2026-02-12T14:25:00"; Title = "Del registro mercantil a la información útil"; Summary = "Cómo pasó la contabilidad de una función registral a una función de información para múltiples usuarios."; Lead = "En sus orígenes modernos, la contabilidad estuvo estrechamente ligada al control mercantil y patrimonial. Con el tiempo, su radio de acción se amplió y empezó a responder a usuarios cada vez más diversos."; Focus = "Esa transición explica muchas tensiones presentes en la información financiera contemporánea."; Questions = @("¿Qué impulsó este cambio histórico?", "¿Cómo se redefinió la función contable?", "¿Qué consecuencias tuvo para la teoría?") },
  @{ Number = 13; Category = "Formación profesional"; Date = [datetime]"2026-02-13T15:00:00"; Title = "La disciplina de tomar apuntes contables útiles"; Summary = "Métodos sencillos para producir apuntes de estudio que realmente ayuden a comprender."; Lead = "Tomar apuntes no consiste en copiar diapositivas ni transcribir explicaciones enteras. Un apunte útil resume conceptos, organiza relaciones y deja espacio para dudas y ejemplos propios."; Focus = "La calidad del apunte influye directamente en la calidad del estudio posterior."; Questions = @("¿Qué debe incluir un buen apunte?", "¿Cómo registrar definiciones y ejemplos?", "¿Qué formato favorece el repaso?") },
  @{ Number = 14; Category = "Lecturas y reseñas"; Date = [datetime]"2026-02-14T15:35:00"; Title = "Cinco libros clave para iniciar en teoría contable"; Summary = "Selección comentada de textos para construir una base teórica sólida."; Lead = "Elegir bien las primeras lecturas puede cambiar el modo en que se comprende la contabilidad. Una bibliografía inicial equilibrada debe combinar claridad, profundidad y variedad de enfoques."; Focus = "El objetivo no es abarcar todo, sino abrir un camino de estudio consistente."; Questions = @("¿Qué libros sirven para comenzar?", "¿Cómo leerlos sin perderse?", "¿Qué orden conviene seguir?") },
  @{ Number = 15; Category = "Información financiera"; Date = [datetime]"2026-02-15T16:10:00"; Title = "Relevancia y representación fiel: dos ideas que conviene discutir"; Summary = "Análisis breve de dos cualidades centrales de la información financiera."; Lead = "La relevancia y la representación fiel suelen presentarse como atributos evidentes. En realidad, cada una plantea dilemas de interpretación, equilibrio y priorización."; Focus = "Comprender estas cualidades mejora tanto la elaboración como la lectura de informes financieros."; Questions = @("¿Qué hace relevante a una información?", "¿Qué implica representar fielmente una realidad compleja?", "¿Cómo se resuelven conflictos entre cualidades?") },
  @{ Number = 16; Category = "Investigación"; Date = [datetime]"2026-02-16T16:45:00"; Title = "Cómo construir un estado del arte en contabilidad"; Summary = "Una guía para organizar antecedentes, autores y debates sin caer en listados superficiales."; Lead = "Un estado del arte no es una acumulación de resúmenes. Es una reconstrucción crítica del campo, capaz de mostrar qué se ha dicho, qué vacíos persisten y dónde puede ubicarse una nueva investigación."; Focus = "La claridad en esta etapa mejora la coherencia del trabajo completo."; Questions = @("¿Qué diferencia un estado del arte de una bibliografía comentada?", "¿Cómo ordenar autores y temas?", "¿Qué errores deben evitarse?") },
  @{ Number = 17; Category = "Educación contable"; Date = [datetime]"2026-02-17T17:20:00"; Title = "La importancia de resolver ejercicios con explicación"; Summary = "Por qué conviene justificar los procedimientos en vez de repetirlos mecánicamente."; Lead = "Resolver ejercicios sin explicar el porqué de cada paso limita el aprendizaje. La comprensión se fortalece cuando el estudiante verbaliza criterios, identifica supuestos y compara alternativas."; Focus = "La explicación convierte el ejercicio en una herramienta de razonamiento."; Questions = @("¿Por qué explicar mejora el aprendizaje?", "¿Cómo documentar un procedimiento?", "¿Qué errores se detectan al justificar decisiones?") },
  @{ Number = 18; Category = "Normas"; Date = [datetime]"2026-02-18T17:55:00"; Title = "Materialidad: una idea sencilla con efectos profundos"; Summary = "Reflexión sobre el concepto de materialidad y su impacto en la presentación de información."; Lead = "Aunque suele explicarse con ejemplos breves, la materialidad involucra juicios complejos sobre relevancia, contexto y usuarios. No es una cifra mágica, sino un criterio de evaluación."; Focus = "Aplicarla bien exige sensibilidad técnica y comprensión del entorno de decisión."; Questions = @("¿Qué significa que algo sea material?", "¿Cómo cambia según el contexto?", "¿Qué riesgos existen al trivializar el concepto?") },
  @{ Number = 19; Category = "Teoría contable"; Date = [datetime]"2026-02-19T18:30:00"; Title = "La medición contable y sus límites"; Summary = "Una revisión de la medición como problema central de la representación económica."; Lead = "Medir en contabilidad supone traducir fenómenos complejos a magnitudes comparables. Esa operación es útil, pero nunca inocente: depende de bases, convenciones y fines de información."; Focus = "Pensar la medición ayuda a entender las tensiones entre precisión, relevancia y oportunidad."; Questions = @("¿Qué bases de medición se utilizan?", "¿Qué pierde la realidad al ser medida?", "¿Cómo se justifican distintas elecciones?") },
  @{ Number = 20; Category = "Historia"; Date = [datetime]"2026-02-20T19:05:00"; Title = "Escuelas de pensamiento contable en el siglo XX"; Summary = "Un mapa introductorio de algunas corrientes teóricas influyentes en el siglo pasado."; Lead = "El siglo XX fue especialmente fértil para la teoría contable. En ese período surgieron debates sobre axiomas, utilidad, regulación, medición y naturaleza del patrimonio que todavía influyen en la enseñanza actual."; Focus = "Conocer esas corrientes permite ubicar mejor los debates contemporáneos."; Questions = @("¿Qué escuelas destacaron?", "¿Qué problemas intentaban resolver?", "¿Qué huellas dejaron en la práctica actual?") },
  @{ Number = 21; Category = "Formación profesional"; Date = [datetime]"2026-02-21T08:10:00"; Title = "Cómo leer un artículo académico de contabilidad"; Summary = "Estrategias para identificar objetivos, argumentos, método y aportes de una lectura especializada."; Lead = "Muchos estudiantes se enfrentan a artículos académicos sin una ruta clara de lectura. Aprender a identificar su estructura reduce la frustración y mejora la comprensión."; Focus = "Leer bien un artículo es una habilidad profesional e investigativa."; Questions = @("¿Qué partes conviene leer primero?", "¿Cómo distinguir resultados de opinión?", "¿Qué notas vale la pena tomar?") },
  @{ Number = 22; Category = "Información financiera"; Date = [datetime]"2026-02-22T08:45:00"; Title = "Estados financieros como narrativas organizadas"; Summary = "Una mirada a los informes financieros como construcciones que ordenan y comunican una visión económica."; Lead = "Los estados financieros no son solo cuadros numéricos. También son narrativas estructuradas que resumen decisiones de clasificación, medición y presentación."; Focus = "Leerlos como narrativas ayuda a encontrar supuestos, énfasis y silencios."; Questions = @("¿Qué historia cuenta un estado financiero?", "¿Cómo se construye esa narrativa?", "¿Qué implicaciones tiene para el análisis?") },
  @{ Number = 23; Category = "Investigación"; Date = [datetime]"2026-02-23T09:20:00"; Title = "Fuentes primarias y secundarias en investigación contable"; Summary = "Distinciones básicas para trabajar con bibliografía, documentos y evidencia de forma rigurosa."; Lead = "Una investigación sólida depende de saber qué tipo de fuente se está utilizando y qué grado de cercanía tiene con el fenómeno estudiado. Confundir fuentes puede debilitar conclusiones."; Focus = "La claridad metodológica empieza por una buena clasificación de materiales."; Questions = @("¿Qué cuenta como fuente primaria?", "¿Cómo usar fuentes secundarias con criterio?", "¿Qué errores metodológicos son frecuentes?") },
  @{ Number = 24; Category = "Educación contable"; Date = [datetime]"2026-02-24T09:55:00"; Title = "Rutinas semanales para aprender contabilidad sin saturarse"; Summary = "Un modelo práctico para estudiar con constancia y evitar la acumulación de trabajo."; Lead = "La saturación suele aparecer cuando el estudio depende del apuro. Una rutina semanal bien diseñada distribuye lectura, resolución de ejercicios, repaso y escritura breve."; Focus = "La regularidad reduce la ansiedad y mejora la retención."; Questions = @("¿Cómo repartir el tiempo durante la semana?", "¿Qué bloques de trabajo son más eficaces?", "¿Cómo sostener la disciplina a largo plazo?") },
  @{ Number = 25; Category = "Normas"; Date = [datetime]"2026-02-25T10:30:00"; Title = "Presentación de información y claridad comunicativa"; Summary = "La importancia de que los informes no solo cumplan reglas, sino que también sean comprensibles."; Lead = "Una información correctamente elaborada puede fracasar si no se presenta de forma clara. La comunicación contable también exige orden, consistencia y legibilidad."; Focus = "La presentación influye en el uso efectivo de la información."; Questions = @("¿Qué hace más comprensible un informe?", "¿Cómo se relaciona forma y fondo?", "¿Por qué la claridad también es una responsabilidad profesional?") },
  @{ Number = 26; Category = "Teoría contable"; Date = [datetime]"2026-02-26T11:05:00"; Title = "La contabilidad como representación de la realidad económica"; Summary = "Discusión sobre el alcance y los límites de representar la realidad a través de cifras y categorías."; Lead = "Representar no es copiar fielmente la realidad, sino organizarla bajo ciertos criterios. La contabilidad produce imágenes útiles, pero parciales, de fenómenos complejos."; Focus = "Este punto es clave para evitar interpretaciones ingenuas de la información contable."; Questions = @("¿Qué significa representar en contabilidad?", "¿Qué queda fuera de la representación?", "¿Cómo se relaciona esta idea con la teoría?") },
  @{ Number = 27; Category = "Historia"; Date = [datetime]"2026-02-27T11:40:00"; Title = "Historia intelectual de la contabilidad en América Latina"; Summary = "Una invitación a pensar autores, traducciones y contextos regionales."; Lead = "El pensamiento contable en América Latina no puede entenderse solo como recepción pasiva de ideas externas. También ha habido apropiaciones, debates locales y trayectorias propias."; Focus = "Mirar la región abre nuevas preguntas para la investigación y la enseñanza."; Questions = @("¿Qué temas marcaron el debate regional?", "¿Qué autores conviene recuperar?", "¿Cómo dialoga la región con tradiciones globales?") },
  @{ Number = 28; Category = "Lecturas y reseñas"; Date = [datetime]"2026-02-28T12:15:00"; Title = "Cómo hacer una reseña crítica de un libro contable"; Summary = "Una guía breve para pasar del resumen a la evaluación argumentada."; Lead = "Reseñar críticamente implica más que describir capítulos. Requiere identificar tesis, valorar aportes, señalar limitaciones y situar la obra en una conversación más amplia."; Focus = "La reseña es un excelente ejercicio para formar criterio académico."; Questions = @("¿Qué estructura puede seguir una buena reseña?", "¿Cómo evitar el resumen plano?", "¿Qué tipo de juicio crítico es deseable?") },
  @{ Number = 29; Category = "Formación profesional"; Date = [datetime]"2026-03-01T12:50:00"; Title = "Construir vocabulario técnico sin perder claridad"; Summary = "Consejos para dominar el lenguaje contable y al mismo tiempo escribir de forma comprensible."; Lead = "El lenguaje técnico es necesario, pero puede convertirse en una barrera cuando se usa sin precisión o sin claridad expositiva. Aprender contabilidad también exige aprender a escribirla."; Focus = "La buena comunicación técnica combina exactitud y sencillez."; Questions = @("¿Cómo adquirir vocabulario especializado?", "¿Qué errores de redacción son frecuentes?", "¿Cómo explicar ideas complejas con claridad?") },
  @{ Number = 30; Category = "Información financiera"; Date = [datetime]"2026-03-02T13:25:00"; Title = "Qué mirar primero al leer un balance general"; Summary = "Una orientación introductoria para leer con criterio el estado de situación financiera."; Lead = "El balance general suele impresionar por su aparente densidad, pero puede leerse con orden si se identifica primero su estructura, sus relaciones básicas y los puntos de mayor sensibilidad."; Focus = "Saber por dónde empezar hace más útil el análisis."; Questions = @("¿Qué secciones conviene revisar primero?", "¿Qué relaciones básicas deben observarse?", "¿Qué pistas ofrece sobre la situación de una entidad?") },
  @{ Number = 31; Category = "Investigación"; Date = [datetime]"2026-03-03T14:00:00"; Title = "Notas metodológicas para estudios documentales en contabilidad"; Summary = "Criterios para trabajar con documentos, archivos y fuentes bibliográficas de forma ordenada."; Lead = "Los estudios documentales siguen siendo fundamentales en contabilidad, especialmente cuando el interés está en conceptos, historia o regulación. Sin método, sin embargo, el trabajo documental se dispersa con facilidad."; Focus = "El orden de recolección y análisis mejora la calidad de la interpretación."; Questions = @("¿Cómo delimitar un corpus documental?", "¿Qué criterios de análisis conviene definir?", "¿Cómo registrar hallazgos de manera útil?") },
  @{ Number = 32; Category = "Educación contable"; Date = [datetime]"2026-03-04T14:35:00"; Title = "Aprender contabilidad en grupo sin perder autonomía"; Summary = "Ventajas y cuidados del estudio colaborativo en temas contables."; Lead = "El trabajo en grupo puede acelerar la comprensión y reducir la sensación de aislamiento, pero también corre el riesgo de repartir tareas sin aprendizaje real. La clave está en colaborar sin delegar la comprensión."; Focus = "Una dinámica bien planteada multiplica el valor del estudio compartido."; Questions = @("¿Qué actividades funcionan bien en grupo?", "¿Cómo evitar la dependencia de otros?", "¿Qué acuerdos mejoran la colaboración?") },
  @{ Number = 33; Category = "Normas"; Date = [datetime]"2026-03-05T15:10:00"; Title = "Cambios de estimación y su lectura profesional"; Summary = "Una reflexión introductoria sobre las estimaciones contables y su revisión."; Lead = "Las estimaciones muestran que la contabilidad también trabaja con incertidumbre. Revisarlas no implica necesariamente error previo, sino adaptación ante nueva información o mejores criterios."; Focus = "Entender este punto evita interpretaciones simplistas sobre los cambios contables."; Questions = @("¿Qué es una estimación contable?", "¿Cuándo puede revisarse?", "¿Cómo se comunica un cambio de estimación?") },
  @{ Number = 34; Category = "Teoría contable"; Date = [datetime]"2026-03-06T15:45:00"; Title = "El concepto de utilidad en debate"; Summary = "Una aproximación al problema de definir y medir la utilidad contable."; Lead = "Pocas nociones son tan centrales y discutidas como la utilidad. Su aparente familiaridad oculta múltiples debates sobre temporalidad, medición y sentido económico."; Focus = "Analizar la utilidad es una puerta de entrada privilegiada a la teoría contable."; Questions = @("¿Qué entendemos por utilidad?", "¿Por qué genera tantas discusiones?", "¿Cómo influye su medición en la interpretación financiera?") },
  @{ Number = 35; Category = "Historia"; Date = [datetime]"2026-03-07T16:20:00"; Title = "La expansión universitaria de la contaduría"; Summary = "Notas sobre la consolidación de la formación contable en instituciones de educación superior."; Lead = "La profesionalización de la contabilidad transformó sus espacios de enseñanza, sus referentes bibliográficos y sus exigencias curriculares. La universidad jugó un papel decisivo en esa expansión."; Focus = "Mirar esa historia ayuda a pensar los retos actuales de la educación contable."; Questions = @("¿Cómo se consolidó la contaduría en la universidad?", "¿Qué tensiones surgieron entre técnica y formación integral?", "¿Qué desafíos persisten hoy?") },
  @{ Number = 36; Category = "Lecturas y reseñas"; Date = [datetime]"2026-03-08T16:55:00"; Title = "Tomar notas de lectura para investigar mejor"; Summary = "Métodos de fichado y comentario para no perder ideas relevantes al leer."; Lead = "Una lectura sin registro suele diluirse rápido. Tomar notas bien estructuradas permite conservar argumentos, citas, dudas y conexiones entre autores."; Focus = "Las notas de lectura son una herramienta de largo plazo para la investigación."; Questions = @("¿Qué conviene anotar al leer?", "¿Cómo separar resumen y comentario propio?", "¿Qué sistemas de fichado resultan prácticos?") },
  @{ Number = 37; Category = "Formación profesional"; Date = [datetime]"2026-03-09T17:30:00"; Title = "La ética del rigor en la formación contable"; Summary = "Pensar el estudio serio como una forma de responsabilidad profesional."; Lead = "La ética profesional empieza antes del ejercicio laboral. También se forma en la calidad del estudio, en la honestidad intelectual y en la disciplina con que se construye el conocimiento."; Focus = "El rigor académico es parte del carácter profesional."; Questions = @("¿Cómo se conecta estudio y ética?", "¿Qué prácticas cotidianas fortalecen esa relación?", "¿Por qué la superficialidad también tiene consecuencias?") },
  @{ Number = 38; Category = "Información financiera"; Date = [datetime]"2026-03-10T18:05:00"; Title = "Notas a los estados financieros: por qué no deben ignorarse"; Summary = "Una defensa de las notas explicativas como parte esencial del análisis financiero."; Lead = "Las notas a los estados financieros suelen quedar relegadas frente a los cuadros principales, aunque allí aparecen criterios, detalles y aclaraciones indispensables para interpretar correctamente la información."; Focus = "Leer las notas es leer la lógica del informe."; Questions = @("¿Qué revelan las notas que no muestran los estados básicos?", "¿Cómo incorporarlas al análisis?", "¿Qué decisiones pueden cambiar al leerlas?") },
  @{ Number = 39; Category = "Investigación"; Date = [datetime]"2026-03-11T18:40:00"; Title = "Cómo citar y referenciar sin perder consistencia"; Summary = "Buenas prácticas para sostener una escritura académica ordenada y verificable."; Lead = "Citar bien no es solo cumplir un requisito formal. También es mostrar el recorrido intelectual de un trabajo y permitir que otros rastreen sus fundamentos."; Focus = "La consistencia en las referencias es parte de la credibilidad académica."; Questions = @("¿Qué errores de citación son frecuentes?", "¿Cómo mantener un sistema consistente?", "¿Qué herramientas pueden ayudar?") },
  @{ Number = 40; Category = "Educación contable"; Date = [datetime]"2026-03-12T19:15:00"; Title = "Cómo preparar una exposición sobre un tema contable"; Summary = "Claves para presentar con claridad un tema técnico frente a un grupo."; Lead = "Exponer bien un tema contable exige comprenderlo lo suficiente como para traducirlo a un lenguaje ordenado, claro y argumentado. No basta con leer diapositivas."; Focus = "La exposición puede convertirse en una herramienta de aprendizaje profundo."; Questions = @("¿Cómo estructurar una exposición breve?", "¿Qué apoyos visuales convienen?", "¿Cómo explicar conceptos técnicos sin simplificarlos demasiado?") },
  @{ Number = 41; Category = "Normas"; Date = [datetime]"2026-03-13T08:20:00"; Title = "Comparabilidad y consistencia en los informes"; Summary = "Una revisión de por qué estas cualidades siguen siendo tan importantes en la práctica contable."; Lead = "La comparabilidad y la consistencia ayudan a que la información pueda leerse en el tiempo y entre entidades. Sin ellas, incluso cifras técnicamente correctas pierden valor analítico."; Focus = "Estas cualidades sostienen buena parte de la utilidad de la información financiera."; Questions = @("¿Qué significa que una información sea comparable?", "¿Cómo se relaciona con la consistencia?", "¿Qué prácticas fortalecen ambas cualidades?") },
  @{ Number = 42; Category = "Teoría contable"; Date = [datetime]"2026-03-14T08:55:00"; Title = "El marco conceptual como mapa de lectura"; Summary = "Cómo utilizar el marco conceptual para interpretar problemas contables de manera más ordenada."; Lead = "El marco conceptual no resuelve todos los casos por sí mismo, pero ofrece un lenguaje y una estructura para formular preguntas más precisas. Leerlo como un mapa puede ser más útil que memorizarlo."; Focus = "Su valor está en orientar el razonamiento, no solo en servir de referencia normativa."; Questions = @("¿Para qué sirve realmente el marco conceptual?", "¿Cómo estudiarlo sin volverlo mecánico?", "¿Qué tipo de problemas ayuda a iluminar?") },
  @{ Number = 43; Category = "Historia"; Date = [datetime]"2026-03-15T09:30:00"; Title = "Autores que vale la pena recuperar en historia contable"; Summary = "Una invitación a volver sobre nombres y obras útiles para ampliar el panorama histórico."; Lead = "Algunas historias de la contabilidad repiten siempre los mismos hitos y dejan por fuera autores que pueden enriquecer mucho la comprensión del campo. Recuperarlos es también ampliar la conversación."; Focus = "La historia contable gana profundidad cuando se diversifican sus referencias."; Questions = @("¿Qué autores suelen pasarse por alto?", "¿Qué aportes ofrecen?", "¿Cómo integrarlos a una ruta de lectura?") },
  @{ Number = 44; Category = "Lecturas y reseñas"; Date = [datetime]"2026-03-16T10:05:00"; Title = "Leer despacio en tiempos de resúmenes rápidos"; Summary = "Una defensa de la lectura atenta en la formación académica contable."; Lead = "La presión por estudiar rápido puede producir una ilusión de avance. En contabilidad, como en otras disciplinas, leer despacio muchas veces permite comprender mejor que consumir muchos resúmenes fragmentarios."; Focus = "La lentitud bien dirigida puede ser una ventaja intelectual."; Questions = @("¿Qué se gana con una lectura más atenta?", "¿Cómo equilibrar profundidad y tiempo?", "¿Qué tipo de textos exigen un ritmo más lento?") },
  @{ Number = 45; Category = "Formación profesional"; Date = [datetime]"2026-03-17T10:40:00"; Title = "Cómo organizar un archivo personal de estudio contable"; Summary = "Ideas prácticas para clasificar apuntes, lecturas y materiales de consulta."; Lead = "Un archivo personal bien organizado ahorra tiempo, mejora el repaso y facilita la escritura posterior. La desorganización documental, en cambio, fragmenta el aprendizaje."; Focus = "Archivar también es una forma de pensar."; Questions = @("¿Qué materiales conviene guardar?", "¿Cómo clasificarlos para encontrarlos rápido?", "¿Qué sistemas simples pueden mantenerse en el tiempo?") },
  @{ Number = 46; Category = "Información financiera"; Date = [datetime]"2026-03-18T11:15:00"; Title = "La lectura crítica de indicadores financieros"; Summary = "Precauciones para usar indicadores sin perder de vista el contexto y sus limitaciones."; Lead = "Los indicadores son útiles porque sintetizan relaciones complejas, pero también pueden simplificar demasiado. Su interpretación exige contexto, comparación y cautela."; Focus = "Un buen análisis financiero no se agota en ratios aislados."; Questions = @("¿Qué ventajas tienen los indicadores?", "¿Qué límites deben reconocerse?", "¿Cómo evitar interpretaciones automáticas?") },
  @{ Number = 47; Category = "Investigación"; Date = [datetime]"2026-03-19T11:50:00"; Title = "Escribir introducciones académicas más claras"; Summary = "Consejos para redactar aperturas de texto con propósito, contexto y dirección argumentativa."; Lead = "Una introducción académica debe orientar al lector desde el comienzo: presentar el tema, justificar su importancia y anticipar el camino del texto. Cuando falla, todo el artículo pierde claridad."; Focus = "Aprender a abrir bien un texto mejora también la calidad del pensamiento."; Questions = @("¿Qué funciones cumple una buena introducción?", "¿Cómo evitar generalidades vacías?", "¿Qué tono conviene utilizar?") },
  @{ Number = 48; Category = "Educación contable"; Date = [datetime]"2026-03-20T12:25:00"; Title = "La retroalimentación como parte del aprendizaje contable"; Summary = "Por qué revisar errores con método ayuda más que simplemente corregir respuestas."; Lead = "La retroalimentación es valiosa cuando se convierte en análisis de decisiones y no solo en marcación de fallos. Revisar con calma por qué algo no funcionó fortalece el aprendizaje futuro."; Focus = "Aprender de los errores requiere método y disposición reflexiva."; Questions = @("¿Cómo aprovechar la retroalimentación?", "¿Qué hacer después de una corrección?", "¿Cómo convertir errores en criterios?") },
  @{ Number = 49; Category = "Normas"; Date = [datetime]"2026-03-21T13:00:00"; Title = "Transparencia, revelación y confianza informativa"; Summary = "Una reflexión sobre la importancia de revelar información suficiente y comprensible."; Lead = "La confianza informativa no se construye solo con cifras exactas. También requiere revelar de forma suficiente los criterios, riesgos y contextos que permiten interpretarlas."; Focus = "La revelación es una condición de confianza y no un mero trámite."; Questions = @("¿Qué relación hay entre revelación y confianza?", "¿Qué hace suficiente a una revelación?", "¿Cómo evaluar la transparencia de un informe?") },
  @{ Number = 50; Category = "Teoría contable"; Date = [datetime]"2026-03-22T13:35:00"; Title = "Cincuenta entradas después: por qué seguir pensando la contabilidad"; Summary = "Cierre provisional del archivo inicial con una defensa del pensamiento contable riguroso."; Lead = "Al completar cincuenta entradas, el archivo confirma una convicción de fondo: la contabilidad merece ser pensada con cuidado, discutida con argumentos y estudiada con paciencia intelectual."; Focus = "Más que cerrar una serie, este texto abre nuevas líneas para seguir escribiendo e investigando."; Questions = @("¿Qué temas quedan abiertos?", "¿Por qué vale la pena seguir escribiendo sobre contabilidad?", "¿Cómo puede crecer este archivo en el futuro?") }
)

$articles = $articles | Sort-Object { [int]$_.Number }

function Get-CategoryPerspective {
  param(
    [string]$Category
  )

  switch ($Category) {
    "Teoría contable" {
      return @{
        Perspective = "En el trasfondo de esta discusión aparece una pregunta constante por el estatuto intelectual de la contabilidad: si debe entenderse solo como técnica aplicada o también como lenguaje, teoría y forma de conocimiento socialmente situada."
        Application = "Llevado al aula y a la investigación, este enfoque invita a leer conceptos con más paciencia, comparar autores y reconocer que las categorías contables no nacen aisladas, sino dentro de tradiciones de pensamiento y decisiones institucionales."
        References = @(
          "Richard Mattessich, <em>Accounting and Analytical Methods</em>.",
          "Ahmed Riahi-Belkaoui, <em>Accounting Theory</em>.",
          "Jorge Tua Pereda, <em>Lecturas de teoría e investigación contable</em>."
        )
      }
    }
    "Historia" {
      return @{
        Perspective = "Mirar históricamente la contabilidad permite entender que sus prácticas actuales son el resultado de largos procesos de cambio, disputa y adaptación institucional. La historia no es un adorno erudito, sino una vía para comprender por qué pensamos hoy como pensamos."
        Application = "Desde esta perspectiva, cada concepto gana espesor cuando se lo ubica en sus contextos de aparición, en las necesidades sociales que buscó atender y en los debates que lo acompañaron."
        References = @(
          "Basil Yamey, estudios sobre historia de la contabilidad y partida doble.",
          "Federico Gertz Manero, trabajos introductorios de historia contable.",
          "Jorge Tua Pereda, textos sobre evolución del pensamiento contable."
        )
      }
    }
    "Formación profesional" {
      return @{
        Perspective = "La formación contable no se limita al dominio instrumental. También exige disciplina de lectura, capacidad de escritura, criterio analítico y hábitos de estudio que permitan sostener aprendizajes complejos en el tiempo."
        Application = "Por eso, este tema toca directamente la vida académica cotidiana: cómo se toman notas, cómo se organizan las lecturas, cómo se corrigen errores y cómo se transforma la práctica de estudio en una práctica intelectual más rigurosa."
        References = @(
          "Paulo Freire, reflexiones sobre lectura crítica y formación.",
          "Ángel Díaz Barriga, aportes sobre enseñanza y trabajo académico.",
          "Bibliografía pedagógica aplicada a educación superior y hábitos de estudio."
        )
      }
    }
    "Información financiera" {
      return @{
        Perspective = "La información financiera adquiere sentido cuando se examina su capacidad para orientar decisiones, comunicar situaciones económicas y hacer visibles ciertos aspectos de la realidad organizacional mientras deja otros en segundo plano."
        Application = "Esto obliga a leer los informes con una mirada menos automática: identificar usuarios, revisar supuestos de presentación y preguntarse qué relaciones o riesgos se vuelven visibles a través de los estados y sus notas."
        References = @(
          "Marco conceptual de la información financiera.",
          "Eldon S. Hendriksen, <em>Accounting Theory</em>.",
          "Textos introductorios de análisis e interpretación de estados financieros."
        )
      }
    }
    "Educación contable" {
      return @{
        Perspective = "La educación contable es un campo donde se cruzan exigencias técnicas, problemas pedagógicos y decisiones curriculares. Pensarla bien implica preguntarse no solo qué se enseña, sino también cómo se aprende y qué tipo de profesional se está formando."
        Application = "En ese marco, los hábitos de estudio, la retroalimentación y las dinámicas de aula dejan de ser asuntos secundarios y pasan a ser parte del núcleo mismo de la formación."
        References = @(
          "Trabajos sobre pedagogía universitaria y didáctica profesional.",
          "Literatura sobre educación contable en América Latina.",
          "Estudios sobre evaluación formativa y aprendizaje reflexivo."
        )
      }
    }
    "Investigación" {
      return @{
        Perspective = "La investigación contable exige rigor en la formulación de problemas, en el uso de fuentes y en la escritura. No basta con elegir un tema interesante: hay que construir una pregunta, una ruta metodológica y una conversación bibliográfica verificable."
        Application = "Por eso estos asuntos son decisivos para estudiantes y docentes que buscan pasar de la curiosidad inicial a un trabajo académico con estructura, trazabilidad y aporte propio."
        References = @(
          "Umberto Eco, <em>Cómo se hace una tesis</em>.",
          "Metodologías de investigación documental y cualitativa.",
          "Textos de escritura académica y construcción del estado del arte."
        )
      }
    }
    "Normas" {
      return @{
        Perspective = "Las normas contables intentan ordenar la práctica y ofrecer criterios comparables, pero siempre requieren interpretación. Su estudio es más fértil cuando se examina la relación entre regla, juicio profesional y condiciones reales de aplicación."
        Application = "En ese sentido, leer normas supone algo más que ubicar requerimientos puntuales: implica entender sus fines, sus supuestos y las zonas en las que el profesional debe justificar sus decisiones."
        References = @(
          "Marco conceptual y bases de presentación de información financiera.",
          "Textos sobre juicio profesional y aplicación normativa.",
          "Estudios sobre materialidad, revelación y consistencia informativa."
        )
      }
    }
    default {
      return @{
        Perspective = "Este tema permite pensar la contabilidad como un campo intelectual que combina práctica, lenguaje, institución y reflexión crítica."
        Application = "Su valor está en abrir preguntas de estudio, análisis e investigación que pueden desarrollarse con mayor profundidad."
        References = @(
          "Bibliografía general de teoría e investigación contable."
        )
      }
    }
  }
}

function Build-ArticlePage {
  param(
    [hashtable]$Article
  )

  $dateDisplay = $Article.Date.ToString("dd/MM/yyyy")
  $timeDisplay = $Article.Date.ToString("HH:mm")
  $entryLabel = "Entrada $($Article.Number)"
  $questionList = ($Article.Questions | ForEach-Object { "          <li>$_</li>" }) -join "`n"
  $categoryPerspective = Get-CategoryPerspective -Category $Article.Category
  $referencesList = ($categoryPerspective.References | ForEach-Object { "          <li>$_</li>" }) -join "`n"

  return @"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$($Article.Title) | Carlos Alberto Sánchez Torres</title>
  <meta
    name="description"
    content="$($Article.Summary)"
  />
  <meta name="author" content="Carlos Alberto Sánchez Torres" />
  <link rel="stylesheet" href="../style.css" />
</head>
<body>
  <header>
    <div class="container">
      <nav>
        <div class="brand">Carlos Alberto Sánchez Torres</div>
        <div class="nav-links">
          <a href="../index.html">Inicio</a>
          <a href="../index.html#articulos">Artículos</a>
          <a href="../index.html#contacto">Contacto</a>
        </div>
      </nav>

      <div class="hero">
        <div>
          <span class="tag">$($Article.Category)</span>
          <h1>$($Article.Title)</h1>
          <p>$($Article.Summary)</p>
        </div>

        <div class="hero-card">
          <h2>$entryLabel</h2>
          <p><strong>Fecha:</strong> $dateDisplay</p>
          <p><strong>Hora:</strong> $timeDisplay</p>
          <p class="quote">$($Article.Focus)</p>
        </div>
      </div>
    </div>
  </header>

  <main>
    <div class="container">
      <section class="panel article-content">
        <a class="back-link" href="index.html">← Ver todos los artículos</a>

        <div class="post-meta">$entryLabel · $($Article.Category) · $dateDisplay · $timeDisplay</div>

        <p class="article-intro">$($Article.Lead)</p>

        <h2>Planteamiento</h2>
        <p>$($Article.Lead)</p>
        <p>$($Article.Focus)</p>

        <h2>Discusión académica</h2>
        <p>$($categoryPerspective.Perspective)</p>
        <p>Desde una perspectiva académica, este asunto invita a revisar conceptos, autores y debates que permiten pasar de una comprensión puramente operativa a una comprensión más reflexiva de la disciplina contable. En ese tránsito, el lector empieza a notar que muchas decisiones aparentemente técnicas descansan en supuestos conceptuales y en marcos de interpretación que vale la pena hacer explícitos.</p>
        <p>$($categoryPerspective.Application)</p>

        <h2>Proyección para el estudio y la escritura</h2>
        <p>Una consecuencia práctica de esta reflexión es que conviene leer con preguntas, comparar enfoques y relacionar el contenido con problemas reales de formación, análisis o investigación. Esa práctica de lectura lenta y argumentada fortalece el criterio y evita que la contabilidad se reduzca a una secuencia de respuestas memorizadas.</p>
        <p>En el marco de este blog, cada entrada busca aportar precisamente a ese tipo de archivo intelectual: un espacio donde la teoría, la historia, la formación y la información financiera puedan dialogar entre sí con mayor claridad y continuidad.</p>

        <h2>Preguntas para profundizar</h2>
        <ul>
$questionList
        </ul>

        <h2>Bibliografía orientativa</h2>
        <ul>
$referencesList
        </ul>

        <h2>Cierre</h2>
        <p>La utilidad de esta entrada está en ofrecer un punto de partida claro para seguir pensando la contabilidad con mayor rigor. Cada tema del archivo puede leerse de manera independiente, pero también forma parte de una conversación más amplia sobre teoría, historia, información y formación profesional.</p>
        <p>Leído en conjunto con las demás publicaciones, este texto contribuye a consolidar una línea de trabajo centrada en el pensamiento contable riguroso, la lectura crítica y la construcción de un archivo propio de estudio e investigación.</p>
      </section>
    </div>
  </main>

  <footer>
    <div class="container">
      © 2026 Carlos Alberto Sánchez Torres · Blog de Contabilidad
    </div>
  </footer>
</body>
</html>
"@
}

foreach ($article in $articles) {
  $content = Build-ArticlePage -Article $article
  $path = Join-Path $articlesDir ("articulo-{0}.html" -f $article.Number)
  [System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
}

$articleCards = ($articles | ForEach-Object {
  $dateDisplay = $_.Date.ToString("dd/MM/yyyy")
  $timeDisplay = $_.Date.ToString("HH:mm")
  $searchText = "entrada $($_.Number) $($_.Category) $($_.Title) $($_.Summary)"
@"
          <article class="card article-card archive-item" data-entry="$($_.Number)" data-search="$searchText">
            <div class="post-meta">Entrada $($_.Number) · $($_.Category)</div>
            <h3>$($_.Title)</h3>
            <p>$($_.Summary)</p>
            <p class="post-datetime">$dateDisplay · $timeDisplay</p>
            <a href="articulo-$($_.Number).html">Leer artículo completo</a>
          </article>
"@
}) -join "`n"

$archiveContent = @"
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Todos los artículos | Carlos Alberto Sánchez Torres</title>
  <meta
    name="description"
    content="Archivo completo de artículos de Carlos Alberto Sánchez Torres ordenado por entrada, con fecha y hora de publicación."
  />
  <meta name="author" content="Carlos Alberto Sánchez Torres" />
  <link rel="stylesheet" href="../style.css" />
</head>
<body>
  <header>
    <div class="container">
      <nav>
        <div class="brand">Carlos Alberto Sánchez Torres</div>
        <div class="nav-links">
          <a href="../index.html">Inicio</a>
          <a href="../index.html#sobre">Sobre mí</a>
          <a href="../index.html#contacto">Contacto</a>
        </div>
      </nav>

      <div class="hero">
        <div>
          <span class="tag">Archivo completo</span>
          <h1>Todos los artículos</h1>
          <p>
            Esta página reúne las 50 entradas del blog en orden de entrada, con fecha y hora de publicación.
          </p>
        </div>

        <div class="hero-card">
          <h2>Orden editorial</h2>
          <p>Los artículos están organizados desde la Entrada 1 hasta la Entrada 50.</p>
          <p class="quote">Cada registro muestra su fecha y hora para conservar el orden exacto del archivo.</p>
        </div>
      </div>
    </div>
  </header>

  <main>
    <div class="container">
      <section class="panel">
        <a class="back-link" href="../index.html#articulos">← Volver al inicio</a>
        <h2 class="section-title">Archivo de artículos</h2>
        <p class="muted">50 publicaciones ordenadas por número de entrada, fecha y hora.</p>
        <div class="archive-toolbar">
          <label class="search-field" for="article-search">
            <span>Buscar en el archivo</span>
            <input id="article-search" type="search" placeholder="Título, categoría, resumen o número de entrada" />
          </label>
          <div class="archive-meta">
            <p id="results-summary" class="results-summary">Mostrando 1-9 de 50 artículos</p>
            <p class="muted">Orden fijo por entrada editorial</p>
          </div>
        </div>
        <div class="articles-list">
$articleCards
        </div>
        <div class="pagination" aria-label="Paginación del archivo">
          <button id="prev-page" class="pagination-button" type="button">Anterior</button>
          <div id="page-numbers" class="page-numbers"></div>
          <button id="next-page" class="pagination-button" type="button">Siguiente</button>
        </div>
      </section>
    </div>
  </main>

  <footer>
    <div class="container">
      © 2026 Carlos Alberto Sánchez Torres · Blog de Contabilidad
    </div>
  </footer>
  <script src="archive.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path $articlesDir "index.html"), $archiveContent, [System.Text.UTF8Encoding]::new($false))
