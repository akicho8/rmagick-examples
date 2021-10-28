#!/bin/sh
  convert -size 120x140 -gravity center -font WebDings label:Y \
          -negate -channel A -combine +channel -fill LightCoral -colorize 100% \
          -background none -fill none -stroke firebrick -strokewidth 3 label:Y \
          -flatten +gravity -chop 0x10+0+0 -shave 0x10 +repage border_heart.png
