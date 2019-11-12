# Basic apps
alias mt-start-all="emacs & google-chrome &"
alias telegram="~/Apps/Telegram/Telegram &"

# Peripherals
alias audio-restart="pulseaudio -k; pulseaudio --start"
alias wifi-connect="nmcli d wifi"

# External storage
alias detach="udisks --detach"
alias detach-sdb="udisks --detach /dev/sdb"

# Screen recording
alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

# System packages
alias mt-update-packages="sudo dnf update"

# Power shortcuts
alias mt-shutdown="sudo shutdown 0"
alias mt-reboot="sudo reboot 0"
alias mt-suspend="systemctl suspend"