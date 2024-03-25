# Debian Dotfiles

This repository contains dotfiles for configuring various applications and settings on a Debian-based system. Dotfiles are configuration files, typically starting with a dot (e.g., `.bashrc`, `.vimrc`), used to personalize and customize software to suit individual preferences.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Introduction

Dotfiles are essential for maintaining a consistent and efficient working environment across different systems. This repository hosts dotfiles that are tailored for a Debian system, ensuring compatibility and ease of use. The dotfiles in this repository are organized into different directories, each corresponding to a specific application or setting. When combined with the `stow` utility, these dotfiles can be easily installed and managed on your system.

## Installation

To use these dotfiles on your system, clone this repository to your home folder (or any other location of your choice) using Git. You can do this by running the following command in your terminal:

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

Optionally, install the `stow` utility to manage the dotfiles:

```bash
sudo apt install stow
```

[stow](https://www.gnu.org/software/stow/) is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. This is especially useful for managing dotfiles, as it allows you to keep all your configuration files in a single directory and symlink them to the appropriate locations.

Once `stow` is installed, you can use it to manage the dotfiles in this repository with ease.

## Usage

After cloning the repository and installing `stow`, navigate to the `~/.dotfiles` directory:

```bash
cd ~/.dotfiles
```

You can install all the dotfiles at once by using `stow` to create symlinks in your home directory:

```bash
stow .
```

Alternatively, you can install the dotfiles for a specific application or setting by navigating to the corresponding directory and using `stow` to create symlinks in your home directory, as in the following example:

```bash
cd ~/.dotfiles
stow -t /bin bin
```


## License

You are free to use and modify these files as you see fit!