#!/bin/sh
convert logo: -transparent white \( +clone -shadow 50x4-5-5 \) +swap -background white -flatten output1.png
