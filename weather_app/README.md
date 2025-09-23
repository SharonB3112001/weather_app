# WeatherApp — Prueba técnica Flutter

App móvil (Android) que muestra **eventos climáticos** y **clima de los últimos 5 días** usando la **VisualCrossing Timeline Weather API**, con **selección de ubicación en mapa**, **favoritos**, **modo offline (capa de cache)** y un **Dashboard + Chat IA** (Gemini) para consultar datos climáticos en español (implementando las apis del clima dadas para la prueba).

---

## Demo rápido (flujo principal)

1. **Splash screen** → navega automáticamente al **Mapa**.  
2. **Mapa** (OpenStreetMap + `flutter_map`):  
   - Botones flotantes: **+** (acercar), **−** (alejar) y **menú**.
   - Toca el mapa para **elegir ubicación** → aparece un **marker**.
   - El **menú** despliega: **Eventos**, **Clima (5 días)**, **Favoritos** y **Chat IA**.
3. **Clima (5 días)**: lista con temperatura promedio, mínima, máxima y condiciones por día. Tap para ver **detalle**.
4. **Eventos climáticos**: lista de eventos (cuando existan). Puedes **añadir a favoritos**.
5. **Favoritos**: lista local de eventos marcados como favoritos.
6. **Chat IA + Dashboard**:  
   - Gráfica de barras compacta (temperatura por día, °C + día de semana).  
   - Chat para hacer **preguntas en español** sobre el clima y eventos **basado en los datos** obtenidos desde las APIs.

> Importante: el menú depende de la **ubicación seleccionada**. Si no has tocado el mapa para colocar un marker, las vistas no cargan datos.

---

## Tecnologías y librerías

- **Flutter** (Dart) — arquitectura por features.
- **Riverpod** — estado y proveedores.
- **flutter_map** + **OpenStreetMap** — mapa interactivo.
- **http** — red.
- **Realm** — persistencia local (cache y favoritos).
- **connectivity_plus** — estado de conexión.
- **fl_chart** — gráficos (dashboard en Chat IA).
- **flutter_dotenv** — manejo de variables de entorno (.env).
- **go_router** — navegación declarativa.
- **Gemini (Google AI)** — chat de IA (`gemini-1.5-flash`).

---

## Variables de entorno

En el archivo .env, encontrarán las key utilizadas y la base del endpoint del clima implementado para la obtencion de los datos

## Compilación y ejecución (Flavors)

El proyecto trae dos flavors (Dev/Prod). Se diferencian por icono y nombre de app; la funcionalidad es la misma.

- **Dev**:
flutter run --target=lib/app/main_dev.dart

- **Prod**:
flutter run --target=lib/app/main_prod.dart

**En .vscode/launch.json hay configuraciones listas para lanzar ambos targets desde VS Code.**

## Cómo usar la app

1. **Splash → Mapa**.  
2. En el **Mapa**:
   - Usa **+** y **−** para ajustar zoom.
   - **Toca** cualquier punto para **elegir ubicación** (marker rojo).
   - Abre el **menú flotante** y elige: **Eventos**, **Clima (5 días)**, **Favoritos** o **Chat IA**.
3. **Clima (5 días)**:
   - Lista con días recientes: promedio, min/max y condiciones.
   - Tap para ver **detalle** de cada día.
4. **Eventos**:
   - Lista de eventos cercanos (si la API los provee).
   - Botón para **agregar/quitar de favoritos**.
5. **Favoritos**:
   - Vista consolidada de eventos favoritos.
6. **Chat IA**:
   - **Gráfica de barras** (día semana vs °C).
   - Chat en español, con contexto real de **clima y eventos**.

---

## Arquitectura

- **Por Features** con capas **data / domain / presentation**.  
- **Riverpod** como gestor de estado.  
- **Repositories** (offline-first) con cache en Realm y fallback sin conexión.  

---

## Modo offline

Se implementó la lógica de **cache con Realm** y la detección del estado de red con `connectivity_plus`.  
El objetivo era que, al no contar con conexión a internet, la aplicación mostrara los **últimos datos almacenados localmente** en el dispositivo.  

La funcionalidad se desarrolló a nivel de repositorios siguiendo un enfoque **offline-first**, sin embargo, durante las pruebas no se logró validar por completo el correcto funcionamiento de la capa offline.  
Esto deja la base lista para que pueda ser finalizada y optimizada mediante estrategias adicionales de sincronización y validación de datos.

---

## Plataformas soportadas

El proyecto fue adaptado y configurado para ser ejecutado y distribuido en **Android**.  
No se realizó la configuración para **iOS**, dado que el desarrollo y despliegue en esta plataforma requiere de dispositivos macOS y hardware Apple, los cuales no estaban disponibles durante el desarrollo de la prueba.  

No obstante, la estructura del proyecto es totalmente compatible con iOS y puede extenderse fácilmente para dicha plataforma agregando los recursos (iconos, configuraciones de Xcode y certificados) correspondientes.

---

## APIs utilizadas

- **VisualCrossing Timeline Weather API**
  - `include=events` para eventos meteorológicos.
  - `pastDays=5` para clima de los últimos 5 días.
- **Google AI (Gemini)**
  - Modelo: `gemini-1.5-flash`
  - Responde preguntas en español usando como contexto la información obtenida desde las APIs.

---

## Internacionalización

- Textos en **español**.  
- Datos en **métrico (°C)**.  

---

## Tests

Archivo de pruebas unitarias básico incluido.

## Comandos utiles

flutter pub get
flutter run --target=lib/app/main_dev.dart
flutter run --target=lib/app/main_prod.dart
flutter test
flutter build apk --target=lib/app/main_prod.dart



