#!/usr/bin/env bash

#Freetube "Player" Script
#Automatically downloads and plays the video requested
#In the case that the video already has a local copy, it'll play that instead.

#TO PAIR IT WITH FREETUBE
#Go to Freetube's Settings
#Go to External Player
#Select any (ie "mpv")
#Then add the shell script's location.
#IF ON FLATPAK: Do flatpak-spawn, then add --host as a custom player argument. and then the location of the Shell Script.
#on both cases: then check "Ignore Default Arguments"

#TO RUN IT INDEPENDENTLY
#just do ./<this script> followed with the Youtube URL of the video you want to download and/or play.

# === User Configuration ===
VIDEO_DIR="/mnt/shared/SDCARD/Videos/YouTube"
MAX_RESOLUTION="480"       # Maximum vertical resolution (e.g., 720 for 720p)
MAX_FPS="30"               # Maximum frames per second

# Preferred codec settings:
# Supported codecs (as identifiers yt-dlp recognizes):
#   • h264   → maps to avc1 (H.264)
#   • vp9    → vp9
#   • av1    → av1
#   • copy   → no re-encoding, default container codec (if available)
PREFERRED_CODEC="h264"     # Default: h264 (will use avc1 filter)
# =========================

URL="$1"

# === Automatically rewrite Invidious URLs ===
# Invidious (inv.nadeko.net) is a YouTube front-end. Convert to standard YouTube URL.
if [[ "$URL" =~ ^https?://inv\.nadeko\.net(.*) ]]; then
    URL="https://www.youtube.com${BASH_REMATCH[1]}"
fi

# === Check Dependencies ===
command -v yt-dlp >/dev/null 2>&1 || { notify-send "FreeTube Cache" "❌ yt-dlp is not installed."; exit 1; }
command -v mpv >/dev/null 2>&1 || { notify-send "FreeTube Cache" "❌ mpv is not installed."; exit 1; }
command -v notify-send >/dev/null 2>&1 || { echo "❌ notify-send not available."; exit 1; }

# === Validate input ===
if [ -z "$URL" ]; then
    notify-send "FreeTube Cache" "❌ No URL provided."
    exit 1
fi

# === Get upload date, channel, and title in one yt-dlp call (This has the added benefit of reducing how frequently does youtube block you from doing new downloads) ===
# Template prints "YYYYMMDD::ChannelName::VideoTitle"
raw_meta=$(yt-dlp --get-filename -o "%(upload_date)s::%(channel)s::%(title)s" "$URL" 2>/dev/null)
if [ -z "$raw_meta" ]; then
    notify-send "FreeTube Cache" "❌ Failed to get video metadata."
    exit 1
fi

# Split raw_meta into upload_date, channel, title
upload_date="${raw_meta%%::*}"
remainder="${raw_meta#*::}"
channel="${remainder%%::*}"
title="${remainder##*::}"

# Sanitize and truncate channel/title (upload_date is already digits YYYYMMDD)
clean_channel=$(echo "$channel" | sed 's/[^a-zA-Z0-9._-]/_/g' | cut -c-100)
clean_title=$(echo "$title"  | sed 's/[^a-zA-Z0-9._-]/_/g' | cut -c-150)

# Fallback if channel name is empty
if [ -z "$clean_channel" ]; then
    clean_channel="Unknown_Channel"
fi

# === Create directory structure ===
channel_dir="$VIDEO_DIR/$clean_channel"
mkdir -p "$channel_dir" || {
    notify-send "FreeTube Cache" "❌ Failed to create channel directory: $clean_channel"
    exit 1
}

# Prepend upload_date (YYYYMMDD) to the filename so that files sort chronologically.
filename="$channel_dir/${upload_date}_${clean_title}.mp4"

# === Determine codec filter for yt-dlp ===
case "$PREFERRED_CODEC" in
    h264)  codec_filter="avc1" ;;
    vp9)   codec_filter="vp9"  ;;
    av1)   codec_filter="av1"  ;;
    copy)  codec_filter=""     ;;  # No codec filter; let yt-dlp pick “best”
    *)
        notify-send "FreeTube Cache" "⚠️ Unsupported codec '$PREFERRED_CODEC'. Falling back to default."
        codec_filter=""
        ;;
esac

# Build format selector:
if [ -n "$codec_filter" ]; then
    FORMAT_STRING="bestvideo[vcodec^=${codec_filter}][height<=${MAX_RESOLUTION}][fps<=${MAX_FPS}]+bestaudio/best[height<=${MAX_RESOLUTION}]"
else
    FORMAT_STRING="bestvideo[height<=${MAX_RESOLUTION}][fps<=${MAX_FPS}]+bestaudio/best[height<=${MAX_RESOLUTION}]"
fi

# === Play from cache or stream and record ===
if [ -f "$filename" ]; then
    notify-send "FreeTube Cache" "▶️ Playing from cache: $clean_title (Channel: $clean_channel, Date: $upload_date)"
    mpv "$filename" || {
        notify-send "FreeTube Cache" "❌ Failed to play cached video."
        exit 1
    }
else
    notify-send "FreeTube Cache" "⬇️ Downloading: $clean_title (${MAX_RESOLUTION}p@${MAX_FPS}fps, codec: ${PREFERRED_CODEC})\nChannel: $clean_channel\nUpload Date: $upload_date"
    
    if ! yt-dlp -f "$FORMAT_STRING" \
        --merge-output-format mp4 \
        -o "$filename" \
        "$URL"; then
        notify-send "FreeTube Cache" "❌ Failed to download video: $clean_title"
        [ -f "$filename" ] && rm -f "$filename"
        exit 1
    fi

    notify-send "FreeTube Cache" "▶️ Now playing: $clean_title (Channel: $clean_channel)"
    mpv "$filename" || {
        notify-send "FreeTube Cache" "❌ Failed to play downloaded video. Removing corrupted file."
        rm -f "$filename"
        exit 1
    }
fi
