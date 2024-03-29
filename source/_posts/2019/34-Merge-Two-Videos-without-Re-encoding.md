---
title: Merge Two Videos without Re-encoding
categories: 多媒体处理
tags: FFmpeg
abbrlink: 34
date: 2019-06-24 21:07:43
---
## Concatenation of Files with Same Codecs

There are two methods within FFmpeg that can be used to concatenate files of the same type: [the concat demuxer & the concat protocol](https://ffmpeg.org/ffmpeg-formats.html#concat)

The demuxer is more flexible – it requires the same codecs, but different container formats can be used; and it can be used with any container formats, while the concat protocol only works with a select few containers.

### The Concat Demuxer

create a text file named vidlist.txt in the following format:

{% code %}
file '/path/to/clip1'
file '/path/to/clip2'
file '/path/to/clip3'
{% endcode %}

Note that these can be either relative or absolute paths.

Then issue the command:

{% code %}
ffmpeg -f concat -safe 0 -i vidlist.txt -c copy output
{% endcode %}

The files will be stream copied in the order they appear in the vidlist.txt into the output container. the "copy codec" is **blazing fast**.

Edit: Note that although the docs say you don't need `-safe 0` if the paths are relative, my testing indicates it's a requirement. It's possible that this may vary with your version of FFmpeg.

There are tips for auto generating the file available in [the docs](https://trac.ffmpeg.org/wiki/Concatenate).

Note: All the clips must already exist or the command will fail because decoding won't start until the whole list is read.

### The Concat Protocol

{% code %}
ffmpeg -i "concat:video1.ts|video2.ts|video3.ts" -c copy output.ts
{% endcode %}

Note: as mentioned above the concat protocol is severely limited in what streams and containers it supports so I never use it. The above is only included in an attempt to create a thorough answer. The concat demuxer is a far better choice for most projects.

**An alternative suggestion:** Personally I prefer using the Matroska container due to it's flexibility and low overhead and join videos with the same encoding using

{% code %}
mkvmerge -o output.mkv input1.mkv + input2.mkv
{% endcode %}

## Concatenation of Files with Different Codecs

If your clips don't use the same codecs for audio and video and/or have different rates, your stuck re-encoding to intermediate files prior to joining which as we all know is both time and resource consuming.

Note that [special characters](http://www.tldp.org/LDP/abs/html/special-chars.html) can break things so if you have these in your filenames you'll need to [deal with them](https://stackoverflow.com/questions/15783701/which-characters-need-to-be-escaped-when-using-bash).
