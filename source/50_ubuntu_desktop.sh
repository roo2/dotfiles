# Ubuntu desktop-only stuff. Abort if not Ubuntu desktop.
is_ubuntu_desktop || return 1

#disable Alt+F8 for IntelliJ
gsettings set org.gnome.desktop.wm.keybindings begin-resize '[]'


#Stop trackpad from going off all the time while typing
synclient PalmDetect=1

alias manh='man -H'
