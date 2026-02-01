

nc -lvkp 8000

python3 -m http.server 8000
python -m http.server 8000


curl http://127.0.0.1:8000

nc 127.0.0.1 8000

telnet <server-ip> 8000

nc -vz <server-ip> 8000

curl http://<server-ip>:8000

