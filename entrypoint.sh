# any user build scripts
test -f /var/opt/entrypoint-hook.sh && sh /var/opt/entrypoint-hook.sh

# start fastcgiwrap
rm -f /var/run/fcgiwrap.socket
nohup fcgiwrap -s unix:/var/run/fcgiwrap.socket &
while ! [ -S /var/run/fcgiwrap.socket ]; do sleep .2; done
chown nginx:www-data /var/run/fcgiwrap.socket
test -f nohup.out && rm ./nohup.out

# start nginx server
nginx -g 'daemon off;'
