# boniOS
A custom bootc image built upon Fedora Silverblue. This is for my own personal use.

I've switched back to regular Fedora Silverblue but I have decided to keep this repo alive just incase I ever want to revisit it.

### Flatpak Applications
```
flatpak remote-modify --disable fedora
flatpak remote-modify --enable flathub
flatpak remove --all --delete-data --assumeyes
sudo flatpak repair
flatpak install flathub --assumeyes be.alexandervanhee.gradia com.discordapp.Discord com.github.tchx84.Flatseal com.github.wwmm.easyeffects com.mattjakeman.ExtensionManager de.haeckerfelix.Fragments de.haeckerfelix.Shortwave io.gitlab.news_flash.NewsFlash io.github.tobagin.karere org.fedoraproject.MediaWriter org.gimp.GIMP org.gnome.baobab org.gnome.Boxes org.gnome.Calculator org.gnome.Calendar org.gnome.Characters org.gnome.clocks org.gnome.Connections org.gnome.Contacts org.gnome.Decibels org.gnome.DejaDup org.gnome.Firmware org.gnome.font-viewer org.gnome.Fractal org.gnome.Logs org.gnome.Loupe org.gnome.Maps org.gnome.Papers org.gnome.Showtime org.gnome.SimpleScan org.gnome.Snapshot org.gnome.TextEditor org.gnome.Weather org.libreoffice.LibreOffice org.mozilla.thunderbird page.tesk.Refine
```

### GNOME Extenions
Caffeine
```
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "caffeine@patapon.info"
```
Copyous
```
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "copyous@boerdereinar.dev"
```

### Fix btrfs compression
There is a bug with atomic desktops where the root mount ignores mount options therefore zstd compression is not enabled by default. I'm using the workaround as described [here.](https://discussion.fedoraproject.org/t/root-mount-options-are-ignored-in-fedora-atomic-desktops-42/148562)

NOTE: I change the default btrfs subvol from the installer so my root is `@` and my home is `@home` etc.
```
sudo rpm-ostree kargs --delete=rootflags=subvol=@ --append=rootflags=subvol=@,compress=zstd:1
sudo sed -i -z 's/UUID/#UUID/' /etc/fstab
```
