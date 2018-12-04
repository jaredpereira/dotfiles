xrdb ~/.Xresources

xmodmap ~/.Xmodmap
exec i3
exec --no-startup-id xautolock -detectsleep -time 5 -locker i3lock -i ~/media/Images/wallpaper.png
