su - evil -c 'mkdir -p ~evil/rtorrent/.session'
rm -f ~evil/rtorrent/.session/rtorrent.lock
/fixuser.sh evil
/fixuser.sh http evil
chmod -R ugo+rw /usr/share/webapps/rutorrent/share/settings
/unevil.sh
php-fpm
nginx
su - evil -c 'screen -d -m -S rtorrent rtorrent'
su - evil -c 'screen -d -m -S irssi irssi'
