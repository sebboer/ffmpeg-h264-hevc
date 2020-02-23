#!/bin/sh

output="${1::-4}.1080p.h265.mkv"

ffmpeg -ss 0 \
	-i $1 \
	-attach "cover.jpg"\
	-map_metadata 0 \
	-map_chapters 0 \
	-metadata title="$3" \
	-map 0:0 -metadata:s:v:0 language=ger \
	-map 0:a \
	-map 0:s \
	-metadata:s:t:0 filename="cover.jpg" -metadata:s:t:0 mimetype="image/jpeg" \
	-c:v libx265 -preset ultrafast -x265-params \
	crf=22:qcomp=0.8:aq-mode=1:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44 \
	-c:a:0 copy \    # copy first audio streams
	-c:a:1 libfdk_aac \ # convert specific audio stream
	-c:s copy \
	$output
