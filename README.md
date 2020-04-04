# Practisimo

This is a little program that generates html pages with youtube embeds next to a picture.

It was meant for backing tracks and sheet music, but get creative with it.

Shake it up.

## Building and installing

```
crystal build src/practisimo.cr
mv practisimo /usr/local/bin
```

## Usage

```
practisimo create "Name of song" -f "path_to_image" -y "youtube EMBED link"
practisimo generate
xdg-open html/Name\ of\ song.html #linux
open html/Name\ of\ song.html #mac
```
