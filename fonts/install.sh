#!/bin/bash
if [ ! -d ~/.fonts ]; then
  mkdir -p ~/.fonts
fi
cp *.ttf ~/.fonts
