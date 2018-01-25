netsh interface portproxy add v4tov4 listenport=80 listenaddress=127.0.0.1 connectport=80 connectaddress=192.168.99.100 protocol=tcp
netsh interface portproxy add v4tov4 listenport=35729 listenaddress=127.0.0.1 connectport=35729 connectaddress=192.168.99.100 protocol=tcp

pause
netsh interface portproxy delete v4tov4 listenport=80 listenaddress=127.0.0.1
netsh interface portproxy delete v4tov4 listenport=35729 listenaddress=127.0.0.1