# Debian Dotfiles

Welcome to the Debian Dotfiles repository! Here, you'll find a collection of configuration files (or "dotfiles") tailored specifically for Debian-based systems. These dotfiles, often starting with a dot (e.g., .bashrc, .vimrc), are instrumental in customizing and fine-tuning various applications and settings to match your preferences and workflow.

## Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Introduction

Maintaining a consistent and efficient working environment across different systems is crucial, and dotfiles play a pivotal role in achieving this consistency. This repository is dedicated to housing dotfiles optimized for Debian systems, ensuring seamless compatibility and ease of use. The dotfiles are neatly organized into distinct directories, each corresponding to a specific application or setting. Leveraging the stow utility, these dotfiles can be effortlessly installed and managed on your system.

## Requirements
To get started, ensure you have Git installed on your Debian-based system. If not already installed, you can do so by executing the following command in your terminal:

```bash
sudo apt install git
```

Alternatively, you can download the repository as a ZIP file and extract it to your home folder.

Optionally, install [GNU Stow](https://www.gnu.org/software/stow/) for efficient management of your dotfiles. You can install stow on your Debian system using the following command:


```bash
sudo apt install stow
```

## Installation

To integrate these dotfiles into your system, clone this repository to your preferred location, typically your home folder, using Git. Execute the following command in your terminal to initiate the cloning process:

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

Install [GNU Stow](https://www.gnu.org/software/stow/) for efficient management of your dotfiles. You can install stow on your Debian system using the following command:

```bash
sudo apt install stow
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


## License

You are free to use and modify these files as you see fit!