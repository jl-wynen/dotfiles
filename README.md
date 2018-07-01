# dotfiles

This is a backup of most of my configurations files.
Feel free to use and modify any of them for yourself.

## Requirements
This project uses [dotdrop](https://github.com/deadc0de6/dotdrop) to manage the files.
File and program requirements differ based on the host.

Common configs exist for
- bash
- git

My main system (`jls-minion`) uses i3 on Manjaro and has the following additional dependencies:
- FontAwesome (for special icons in text)
- termite
- compton
- i3lock-color (And an image for the lock screen, see [lock_screen.sh](dotfiles/bin/lock_screen.sh)

## Usage
Clone this repo using `--recursive` and run `./dotdrop/bootstrap.sh` from inside of it.
Then follow the instructions in the dotdrop README.
