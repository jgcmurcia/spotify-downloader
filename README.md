
# 🎵 Spotify Weekly Downloader

Automate weekly downloads of Spotify playlists using [spotDL](https://github.com/spotDL/spotify-downloader) via Docker. This script generates `.m3u` playlist files and sends a summary to your Telegram, making it perfect for maintaining a personal music library that integrates with media players like **Navidrome**.

---

## 📦 Requirements

- 🐳 [Docker](https://www.docker.com/)
- 🤖 Telegram bot token & your chat ID
- 🎧 Public Spotify playlist URLs
- 📚 *Optional*: [Navidrome](https://www.navidrome.org/) to stream and manage your music library

---

## 🛠️ Configuration

1. Clone the repo:

   ```bash
   git clone https://github.com/jgcmurcia/spotify-weekly-downloader.git
   cd spotify-weekly-downloader


2. Edit the script `spotify-weekly-downloader.sh`:

   Replace these values:

   * `/ruta/a/tu/musica` → your actual music folder
   * `/ruta/a/cache/spotdl` → spotDL cache folder
   * `TU_BOT_TOKEN` → your Telegram bot token
   * `TU_CHAT_ID` → your Telegram chat ID

> 🎯 **Tip:** All playlists are stored in the `PLAYLISTS` array using this format:
>
> ```
> name|https://open.spotify.com/playlist/...
> ```

---

## 🚀 Usage

Run manually:

```bash
bash spotify-weekly-downloader.sh
```

Automate with `cron` to run every Monday at 7:00 AM:

```bash
0 7 * * 1 /ruta/completa/spotify-weekly-downloader.sh
```

---

## 🎧 Navidrome Integration

If you're using [Navidrome](https://www.navidrome.org/) to stream your music:

* Point Navidrome to your `/music` directory (used in the script).
* It will **automatically detect the `.m3u` files** and import them as playlists.
* You’ll be able to access them from any Subsonic-compatible client.

---

## 📱 Mobile Access

Stream your music on the go using these apps:

| Platform   | App                                                                          | Description                       |
| ---------- | ---------------------------------------------------------------------------- | --------------------------------- |
| 🟢 Android | [Symfonium](https://play.google.com/store/apps/details?id=com.symfonium.app) | Modern, powerful Navidrome client |
| 🍎 iOS     | [Substream](https://apps.apple.com/app/substream/id6450831192)               | Simple and clean Subsonic client  |

---


