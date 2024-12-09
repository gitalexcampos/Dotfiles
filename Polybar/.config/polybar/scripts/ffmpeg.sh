#!/bin/sh

# Verifica se o ffmpeg está rodando
if pgrep -x "ffmpeg" > /dev/null; then
    # Se o ffmpeg estiver rodando, mostra o ícone da câmera em verde e "Recording" em cinza
    echo "%{F#00FF00}%{F-} Recording"
else
    # Caso o ffmpeg não esteja rodando, não mostra nada ou outro ícone
    echo ""
fi
