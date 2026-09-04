# BRD Tool

Una herramienta simple y transparente en **Windows Batch (.bat)** para instalar, actualizar y desinstalar **BetterRenderDragon** en **Minecraft Bedrock para Windows 10 / 11**.

BRD Tool simplifica la instalación de BetterRenderDragon y automatiza gran parte del proceso sin modificar mundos, resource packs ni otros mods.

* * *

## ✨ Funciones

* Detecta automáticamente la instalación de Minecraft Bedrock.
* Instala `WINHTTP.dll`, `config.ini` y prepara la carpeta de mods.
* Consulta y descarga la última versión de BetterRenderDragon.
* Permite elegir entre:
  * `BetterRenderDragon.dll`
  * `BetterRenderDragon-no-imgui.dll`
  * Instalación manual
* Actualiza BetterRenderDragon de forma segura.
* Muestra el estado de los archivos instalados.
* Limpia instalaciones antiguas de BRD Tool.
* Desinstala únicamente los archivos administrados por la herramienta.
* Código completamente abierto en `.bat`.

* * *

## 📋 Requisitos

* Windows 10 o Windows 11.
* Minecraft Bedrock Edition para Windows instalado desde el launcher oficial.
* Conexión a Internet.
* Ejecutar BRD Tool como **Administrador** si Windows lo requiere.

* * *

## ▶️ Cómo usar

1. Descarga la versión más reciente desde [Releases](https://github.com/alecstry/BRD-Tool/releases).
2. Ejecuta el archivo `.bat`.
3. Sigue el menú en pantalla.

### Menú principal

* **Instalación Base:** instala y configura los archivos necesarios y permite instalar BetterRenderDragon.
* **Instalar / Actualizar BetterRenderDragon:** descarga la última release y permite elegir la variante.
* **Refrescar Estado:** vuelve a comprobar los archivos instalados.
* **Desinstalar BetterRenderDragon:** elimina únicamente los archivos administrados por la herramienta.

* * *

## 🔎 Si BRD Tool no encuentra Minecraft

Abre:

**Minecraft Launcher → Minecraft Bedrock Edition → Instalación**

Copia la ubicación que aparece, por ejemplo:

    C:

Pégala en BRD Tool y presiona **Enter**.

La herramienta buscará automáticamente:

    Minecraft for Windows\Content

> La detección está pensada para **Minecraft Bedrock estable**, no para Minecraft Preview.

* * *

## 🐉 BetterRenderDragon

BRD Tool consulta automáticamente la última release oficial de:

https://github.com/QYCottage/BetterRenderDragon

La carpeta de mods utilizada es:

    %APPDATA%\Minecraft Bedrock\mods

Usa solamente **una variante de BetterRenderDragon a la vez**.

Si prefieres hacerlo manualmente, BRD Tool puede abrir la página de releases y la carpeta `mods`.

* * *

## 🛡️ Windows Security / Microsoft Defender

Windows Security puede detectar o bloquear las DLL de BetterRenderDragon.

BRD Tool **no desactiva Windows Security, no crea exclusiones y no intenta omitir el antivirus**.

Si recibes una alerta y decides confiar en el archivo, revisa manualmente:

**Seguridad de Windows → Protección contra virus y amenazas → Historial de protección**

Si una actualización es bloqueada, BRD Tool intenta conservar la versión de BetterRenderDragon que ya estaba instalada.

* * *

## ⚙️ WINHTTP / ModLoader

BRD Tool utiliza:

https://github.com/faizul726/ModLoader

`WINHTTP.dll` se instala junto a `Minecraft.Windows` y se verifica antes de instalarse.

* * *

## ⚠️ Disclaimer

* Este proyecto **no está afiliado a Mojang, Microsoft, QYCottage ni a los desarrolladores de ModLoader**.
* BetterRenderDragon y ModLoader son proyectos externos.
* Minecraft es propiedad de Mojang Studios / Microsoft.
* Usa esta herramienta bajo tu propia responsabilidad.

* * *

## 📺 Tutorial en video

https://www.youtube.com/watch?v=IcFeGzNwuwY

Canal:

https://www.youtube.com/@alecstry

* * *

## 📜 Licencia

Este proyecto se distribuye bajo la **Licencia MIT**.

Consulta [`LICENSE.txt`](LICENSE.txt).
