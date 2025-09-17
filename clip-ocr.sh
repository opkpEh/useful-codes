#!/usr/bin/env bash

text=$(xclip -selection clipboard -t image/* -o | magick - png:- | tesseract stdin stdout 2>/dev/null)

echo -n "$text" | xclip -selection clipboard
