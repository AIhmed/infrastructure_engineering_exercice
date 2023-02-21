import requests

while 1:
    r = requests.get("http://34.69.127.35/")
    print(r.content)

