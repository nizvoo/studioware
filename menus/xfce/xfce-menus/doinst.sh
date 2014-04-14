# Backup the old menu file, just in case, but don't clobber
# if we already have Studioware in it.

if [ -z "$(grep Studioware etc/xdg/menus/xfce-applications.menu)" ]; then
    mv etc/xdg/menus/xfce-applications.menu \
        etc/xdg/menus/xfce-applications.menu.orig
fi

# Move our menu into place
mv etc/xdg/menus/xfce-applications.menu.new \
    etc/xdg/menus/xfce-applications.menu

# Test to see if we are actually using xfdesktop and reload it
if [ -n "$(pgrep xfdesktop)" ]; then
    /usr/bin/xfdesktop --reload
fi
