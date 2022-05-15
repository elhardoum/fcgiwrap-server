# start fastcgiwrap
rm -f /var/run/fcgiwrap.socket
nohup fcgiwrap -s unix:/var/run/fcgiwrap.socket &
while ! [ -S /var/run/fcgiwrap.socket ]; do sleep .2; done
chown -R nginx:www-data /var/run/fcgiwrap.socket
test -f nohup.out && rm ./nohup.out

# start nginx server
nginx -g 'daemon off;'
