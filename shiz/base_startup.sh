if [ ! -f /config/.rtorrent.rc ]; then
	cp ~evil/shiz/.rtorrent.rc /config/.
fi
if [ ! -f /config/autodl.cfg ]; then
	cp ~evil/shiz/autodl.cfg /config/.
fi
if [ ! -f /config/autobrr/config.toml ]; then
	cp ~evil/shiz/config.toml /config/autobrr/.
fi
/runuser.sh evil 'mkdir /config/{rtorrent,rutorrent}'
su - evil -c 'mkdir -p ~evil/rtorrent/.session'
rm -f ~evil/rtorrent/.session/rtorrent.lock
/fixuser.sh evil
/fixuser.sh http evil
chage -E -1 http
echo usermod -G wheel http >> /reevil.sh
chown -R evil:evil /usr/share/webapps/rutorrent/share/settings
chmod -R ugo+rw /usr/share/webapps/rutorrent/share/settings
/unevil.sh
php-fpm
nginx
su - evil -c 'screen -d -m -S autobrr /run_autobrr.sh'
su - evil -c 'screen -d -m -S flood /run_flood.sh'
su - evil -c 'screen -d -m -S rtorrent /run_rtorrent.sh'
su - evil -c 'screen -d -m -S irssi irssi'
if [ -z /config/extra_startup.sh ]; then
	/config/extra_startup.sh
fi
