
if [[ -z ${1} ]]; then
  echo "[ERROR]: playlist url required"
  exit 1
fi

yt-dlp -f bestaudio \
  --extract-audio \
  --audio-format mp3 \
  --audio-quality 0 \
  --embed-thumbnail "${1}"
