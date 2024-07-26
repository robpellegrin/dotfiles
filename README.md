# Linux Dotfiles

Welcome to my Linux dotfiles repository! Here, you'll find a collection of configuration files (or "dotfiles") tailored specifically for Linux-based systems. These dotfiles, often starting with a dot (e.g., .bashrc, .vimrc), are instrumental in customizing and fine-tuning various applications and settings to match your preferences and workflow.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

Maintaining a consistent and efficient working environment across different systems is crucial, and dotfiles play a pivotal role in achieving this consistency. This repository contains a carefully curated set of dotfiles that help streamline your development workflow and system setup.

These configurations cover various aspects of the Linux environment, including shell settings, editor preferences, and other essential tools. By using these dotfiles, you can replicate a familiar and productive environment on any Linux machine, reducing setup time and minimizing friction.

## Installation

To integrate these dotfiles into your system, clone this repository to your preferred location, typically your home folder, using Git. 

Install [GNU Stow](https://www.gnu.org/software/stow/) for efficient management of your dotfiles. You can install stow on  using the following command:

Debian:
```bash
sudo apt install stow
```

Fedora:
```
sudo dnf install stow
``` 

## Usage

Once the repository is cloned and stow is installed (if desired), navigate to the ~/.dotfiles directory in your terminal:

```bash
cd ~/dotfiles
```

To install all dotfiles at once, utilize stow to create symbolic links in your home directory:

```bash
stow .
```

Alternatively, for selective installation of dotfiles within a specific directory, employ the -t flag to specify the target directory. For instance, to install dotfiles located in the bin directory, execute the following command:

```bash
stow -t /bin bin
```

The command above establishes symlinks from ~/.dotfiles/bin to /bin. Depending on the directory you're copying to, you might need to utilize sudo for symlink creation.

