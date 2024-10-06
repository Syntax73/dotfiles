# My dotfiles 📁 

This repository contains all dotifies that i use

## Requirements 📑  

- git
- stow

## Installation 🔨 

Fist, install the required packages

``` bash
sudo pacman -S git stow
```

Second, clone this repository using one of the two commands

``` bash
git clone https://github.com/Syntax73/dotfiles.git #HTTP
git clone git@github.com:Syntax73/dotfiles.git #SSH
```
Now you can use stow to create the symlink

``` bash
cd dotfiles
stow .
```