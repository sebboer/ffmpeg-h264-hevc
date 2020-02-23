#!/bin/sh

output="${1::-4}.aac.mkv"

ffmpeg -ss 0 \
	-i $1 \
	-map_metadata 0 \
	-map_chapters 0 \
	-map 0:0 \
	-map 0:a \
	-map 0:s \
	-c:v copy \    # copy all video streams
	-c:a copy \    # copy all audio streams
	-c:a:1 libfdk_aac \ # convert specific audio stream
	-c:s copy \
	$output
