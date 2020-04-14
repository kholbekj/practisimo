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

The project conveniently has most of the folder structure you need, so running from there is easy. Otherwise, you'll get some errors if you don't set up folders for songs, site, etc. Also, the site already has some really neat CSS that I made. Relly neat.

```
practisimo create "Name of song" -f "path_to_image" -y "youtube video identifier"
practisimo generate
xdg-open site/index.html #linux
open site/index.html #mac
```

## Publishing your repertoire

If, like me, you just can't get enough of that "practise-from-ANYWHERE"-mojo of internet fueled pamphlets, the way I do it is with surge.sh; If you opt to do so too, simply:

```
surge site/
```

 (Provided you put your pictures somewhere in the site folder. I know, a few gotchas. You'll surmount 'em.)
