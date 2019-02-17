# rutorrent

VOLUME /home/evil/downloads
VOLUME /home/evil/rtorrent
VOLUME /usr/share/webapps/rutorrent/share/settings

/home/evil/.rtorrent.rc
/home/evil/.autodl/autodl.cfg

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

