# spotify-downloader
Automates weekly downloads of Spotify playlists using spotDL, generates .m3u files, and sends a Telegram message with newly added songs. Ideal for personal music libraries and scheduled syncing.

# 🎵 Spotify Weekly Downloader

Este script en Bash descarga automáticamente varias playlists de Spotify usando `spotDL`, genera archivos `.m3u` para cada lista, y envía un resumen por Telegram si hay canciones nuevas.

## 📦 Requisitos

- Docker
- Cuenta de Telegram con un bot y chat ID
- Acceso a las playlists de Spotify (públicas)

## 🛠️ Configuración

1. Clona el repositorio y edita el script `spotify-weekly-downloader.sh`
2. Reemplaza los siguientes valores:
   - `/ruta/a/tu/musica` por tu carpeta local de música
   - `/ruta/a/cache/spotdl` por la ruta de caché de `spotDL`
   - `TU_BOT_TOKEN` por el token de tu bot de Telegram
   - `TU_CHAT_ID` por tu ID de chat

## 🚀 Uso

```bash
bash spotify-weekly-downloader.sh

Puedes automatizarlo con cron para que se ejecute semanalmente, por ejemplo los lunes a las 7:00:

bash
Copiar
Editar
0 7 * * 1 /ruta/al/script/spotify-weekly-downloader.sh
