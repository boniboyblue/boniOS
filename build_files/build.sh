#!/bin/bash

set -ouex pipefail

# RPM Fusion
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm --assumeyes

# Fedora packages to remove
dnf remove --assumeyes \
fedora-flathub-remote \
fedora-bookmarks \
gnome-tour \
fedora-repos-archive \
gnome-classic-session \
gnome-shell-extension-common \
gnome-shell-extension-apps-menu \
gnome-shell-extension-launch-new-instance \
gnome-shell-extension-places-menu \
gnome-shell-extension-window-list \
gnome-software \
gnome-software-rpm-ostree \
dnf5daemon-server \
dnf5daemon-server-polkit \
epiphany-runtime \
gnome-app-list \
rpm-plugin-dbus-announce

# Fedora packages to install
dnf install --assumeyes \
fedora-repos-ostree \
openh264 \
mozilla-openh264 \
intel-media-driver

# Cleanup
dnf remove --assumeyes rpmfusion-nonfree-release rpmfusion-free-release
dnf autoremove --assumeyes
dnf clean all
