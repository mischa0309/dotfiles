#!/usr/bin/env bash

stow -t ~/.config config
stow -t ~/.local  local
stow -t ~         home
stow -t ~/Pictures pictures
