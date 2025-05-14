#!/bin/bash

# --- Configuración ---
LOG_FILE="/ruta/a/tu/log/spotify_added.log"
TEMP_LOG="/tmp/spotify_temp.log"
BOT_TOKEN="TU_BOT_TOKEN"
CHAT_ID="TU_CHAT_ID"

# --- Inicializar logs ---
echo "🎶 Descarga semanal - $(date)" >> "$LOG_FILE"
echo "" > "$TEMP_LOG"  # Limpiar log temporal

# --- Playlists ---
PLAYLISTS=(
  "top50spain|https://open.spotify.com/playlist/37i9dQZEVXbNFJfN1Vw8d9"
  "viral50spain|https://open.spotify.com/playlist/37i9dQZEVXbMfVLvbaC3bj"
  "top50global|https://open.spotify.com/playlist/37i9dQZEVXbMDoHDwVN2tF"
  "topcancionesEsp|https://open.spotify.com/playlist/37i9dQZEVXbJwoKy8qKpHG"
  "indie25|https://open.spotify.com/playlist/4lKOBXoYWsEBLyZkzNmnfP"
  "gym|https://open.spotify.com/playlist/37i9dQZF1DWYp5sAHdz27Y"
  "viralmundial|https://open.spotify.com/playlist/37i9dQZEVXbLiRSasKsNU9"
  "los90|https://open.spotify.com/playlist/37i9dQZF1DWXm9R2iowygp"
  "los80|https://open.spotify.com/playlist/37i9dQZF1DWU4xtX4v6Z9l"
  "djrabjobos|https://open.spotify.com/playlist/37i9dQZF1E4oGvFOm0GGKJ"
  "los2000|https://open.spotify.com/album/3E5hy15kBWv5bxvHyHzFiI"
)

# --- Descarga por playlist ---
for entry in "${PLAYLISTS[@]}"; do
  name="${entry%%|*}"
  url="${entry##*|}"

  echo -e "\n📁 Playlist: $name" >> "$LOG_FILE"

  docker run --rm \
    -v /ruta/a/tu/musica:/music \
    -v /ruta/a/cache/spotdl:/root/.cache/spotdl \
    spotdl/spotify-downloader \
    download "$url" \
    --output "/music/$name" \
    --overwrite skip \
    --generate-lrc \
    --playlist-retain-track-cover \
    --id3-separator " / " \
    --force-update-metadata \
    | grep -E "Downloaded|Downloading" >> "$TEMP_LOG"

  # Añadir al log principal
  cat "$TEMP_LOG" >> "$LOG_FILE"

  # --- Generar archivo .m3u ---
  MUSIC_ROOT="/ruta/a/tu/musica"
  PLAYLIST_PATH="${MUSIC_ROOT}/${name}"
  M3U_PATH="${MUSIC_ROOT}/${name}.m3u"

  echo "#EXTM3U" > "$M3U_PATH"
  find "$PLAYLIST_PATH" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.m4a" -o -iname "*.ogg" \) | sort | while read -r file; do
    rel_path="${file#$MUSIC_ROOT/}"
    echo "$rel_path" >> "$M3U_PATH"
  done
done

echo -e "\n✅ Finalizado: $(date)\n------------------------------" >> "$LOG_FILE"

# --- Enviar mensaje por Telegram ---
if [ -s "$TEMP_LOG" ]; then
  MSG=$(tail -n 50 "$TEMP_LOG")
  if [ -n "$MSG" ]; then
    curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage \
      -d chat_id="$CHAT_ID" \
      --data-urlencode text="$MSG"
  else
    curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage \
      -d chat_id="$CHAT_ID" \
      --data-urlencode text="🎧 No hay nuevas canciones esta semana."
  fi
else
  curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage \
    -d chat_id="$CHAT_ID" \
    --data-urlencode text="🎧 No hay nuevas canciones esta semana."
fi
