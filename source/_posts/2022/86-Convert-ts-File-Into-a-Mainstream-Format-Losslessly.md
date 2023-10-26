---
title: Convert .ts File Into a Mainstream Format Losslessly
date: 2022-04-06 21:15:37
categories: 多媒体处理
tags: FFmpeg
abbrlink: 86
references:
  - https://askubuntu.com/questions/716424/how-to-convert-ts-file-into-a-mainstream-format-losslessly
---
## Matroska (MKV)

This will stream copy (re-mux) all streams:

{% code %}
ffmpeg -i input.ts -map 0 -c copy output.mkv
{% endcode %}

The `-map 0` option is used to include all streams. Otherwise it will use the default stream selection behavior which would only result in one stream per stream type being selected. Since Matroska can handle most arbitrary streams I included `-map 0`.

## MP4

This will stream copy (re-mux) all streams:

{% code %}
ffmpeg -i input.ts -map 0 -c copy output.mp4
{% endcode %}

If your inputs formats are not compatible with MP4 you will get an error. Your player/device may not support all arbitrary, less common, or legacy formats even if they are supported by MP4. If in doubt re-encode to H.264 + AAC as shown below.

This will re-encode the video to H.264 and stream copy the audio:

{% code %}
ffmpeg -i input.ts -c:v libx264 -c:a copy output.mp4
{% endcode %}

The next example will re-encode both video and audio:

{% code %}
ffmpeg -i input.ts -c:v libx264 -c:a aac output.mp4
{% endcode %}

Lossless H.264 example:

{% code %}
ffmpeg -i input.ts -c:v libx264 -crf 0 -c:a copy output.mp4
{% endcode %}

Lossless files will be huge.
