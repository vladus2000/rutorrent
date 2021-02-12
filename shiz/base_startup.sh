if [ ! -f /config/.rtorrent.rc ]; then
	cp ~evil/.rtorrent.rc /config/.
fi
if [ ! -f /config/autodl.cfg ]; then
	cp ~evil/autodl.cfg /config/.
fi
/runuser.sh evil 'mkdir /config/{rtorrent,rutorrent}'
su - evil -c 'mkdir -p ~evil/rtorrent/.session'
rm -f ~evil/rtorrent/.session/rtorrent.lock
/fixuser.sh evil
/fixuser.sh http evil
chown -R evil:evil /usr/share/webapps/rutorrent/share/settings
chmod -R ugo+rw /usr/share/webapps/rutorrent/share/settings
/unevil.sh
php-fpm
nginx
su - evil -c 'screen -d -m -S rtorrent /run_rtorrent.sh'
su - evil -c 'screen -d -m -S irssi irssi'
if [ -z /config/extra_startup.sh ]; then
	/config/extra_startup.sh
fi
