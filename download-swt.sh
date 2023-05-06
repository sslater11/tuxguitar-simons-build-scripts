#!/bin/bash
# put script in the tuxguitar root folder and run to download all the SWT versions that the current and previous versions use.

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
build_dir="$script_dir/../build-scripts/tuxguitar-linux-x86_64"

cd "$build_dir"

# swt 4.11
wget -O swt-4.11-gtk-linux-x86_64.zip http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.11-201903070500/swt-4.11-gtk-linux-x86_64.zip
unzip swt-4.11-gtk-linux-x86_64.zip -d swt-4.11-gtk-linux-x86_64


# swt 4.12
wget -O swt-4.12-gtk-linux-x86_64.zip http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.12-201906051800/swt-4.12-gtk-linux-x86_64.zip
unzip swt-4.12-gtk-linux-x86_64.zip -d swt-4.12-gtk-linux-x86_64


# swt 4.13
wget -O swt-4.13-gtk-linux-x86_64.zip http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.13-201909161045/swt-4.13-gtk-linux-x86_64.zip
unzip swt-4.13-gtk-linux-x86_64.zip -d swt-4.13-gtk-linux-x86_64
