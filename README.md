# 🎵 Spotify Weekly Downloader

Automates weekly downloads of Spotify playlists using [spotDL](https://github.com/spotDL/spotify-downloader), generates `.m3u` files for each playlist, and sends a Telegram notification with any newly added songs. Perfect for building your own music library and syncing it with media players.

## 📦 Requirements

- Docker
- Telegram bot token and chat ID
- Access to public Spotify playlists
- Optional: [Navidrome](https://www.navidrome.org/) to stream and manage the downloaded music

## 🛠️ Configuration

1. Clone this repository and edit the script `spotify-weekly-downloader.sh`
2. Replace the following values:
   - `/ruta/a/tu/musica` → your music folder path
   - `/ruta/a/cache/spotdl` → your spotDL cache path
   - `TU_BOT_TOKEN` → your Telegram bot token
   - `TU_CHAT_ID` → your Telegram chat ID

> Tip: All playlists are defined in the `PLAYLISTS` array using the format `name|url`

## 🚀 Usage

Run the script manually:

```bash
bash spotify-weekly-downloader.sh


Puedes automatizarlo con cron para que se ejecute semanalmente, por ejemplo los lunes a las 7:00:

bash
Copiar
Editar
0 7 * * 1 /ruta/al/script/spotify-weekly-downloader.sh
