# Debian Dotfiles

This repository contains dotfiles for configuring various applications and settings on a Debian-based system. Dotfiles are configuration files, typically starting with a dot (e.g., `.bashrc`, `.vimrc`), used to personalize and customize software to suit individual preferences.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Dotfiles are essential for maintaining a consistent and efficient working environment across different systems. This repository hosts dotfiles that are tailored for a Debian system, ensuring compatibility and ease of use. The dotfiles in this repository are organized into different directories, each corresponding to a specific application or setting. When combined with the `stow` utility, these dotfiles can be easily installed and managed on your system.

## Installation

To use these dotfiles on your Debian system, you can clone this repository to your local machine:

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

Optionally, install the `stow` utility to manage the dotfiles:

```bash
sudo apt install stow
```

'stow' is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. Once 'stow' is installed, you can use it to manage the dotfiles in this repository with ease.

## Usage

To install the dotfiles for a specific application or setting, navigate to the corresponding directory and use `stow` to create symlinks in your home directory:

```bash
cd ~/.dotfiles
stow bash
```

This will create symlinks for the bash configuration files in your home directory. You can repeat this process for other directories to install additional dotfiles:

```bash
stow vim
stow git
```

You can easily copy them all at once by running:

```bash
stow *
```

## Customization

You can customize the dotfiles to suit your preferences by editing the configuration files in each directory. Feel free to modify the settings, add new configurations, or remove existing ones as needed.

## License

You are free to use and modify these files as you see fit!