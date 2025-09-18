#!/usr/bin/env bash

text=$(xclip -selection clipboard -t image/* -o | magick - png:- | tesseract stdin stdout 2>/dev/null)

echo -n "$text" | xclip -selection clipboard

output=""

for (( i=0; i<${#text}; i++ ));
do
	char="${text:$i:1}"
	if [[ "$char" == " " ]]
	then
		output="${output}%20"
	else
		output="${output}${char}"
	fi
done

curl -X GET '[add your AI api]/$output'
