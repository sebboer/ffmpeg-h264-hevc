#!/bin/sh

ffmpeg -ss 0 \
	-i $1 \
	-attach "cover.jpg"\
	-map_metadata 0 \
	-map_chapters 0 \
	-metadata title="$3" \
	-map 0:0 -metadata:s:v:0 language=ger \
	-map 0:1 -metadata:s:a:0 language=ger -metadata:s:a:0 title="German Surround 5.1 (DTS)" \
	-map 0:2 -metadata:s:a:1 language=eng -metadata:s:a:1 title="English Surround 5.1 (DTS)" \
	-map 0:3 -metadata:s:s:0 language=ger -metadata:s:s:0 title="German - FORCED" \
	-map 0:4 -metadata:s:s:1 language=ger -metadata:s:s:1 title="German - SUBS" \
	-map 0:5 -metadata:s:s:2 language=eng -metadata:s:s:2 title="English - FORCED" \
	-map 0:6 -metadata:s:s:3 language=eng -metadata:s:s:3 title="English - SUBS" \
	-metadata:s:t:0 filename="cover.jpg" -metadata:s:t:0 mimetype="image/jpeg" \
	-c:v libx265 -preset ultrafast -x265-params \
	crf=22:qcomp=0.8:aq-mode=1:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44 \
	-c:a copy \
	-c:s copy \
	$2
#	-t 120 \

