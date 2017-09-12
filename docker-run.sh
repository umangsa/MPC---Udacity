docker rm -f carnd-mpc
docker run --rm --name carnd-mpc -v `pwd`:/project -it -e http_proxy -e https_proxy -p 4567:4567 carnd-mpc
