import requests

while 1:
    r = requests.get("http://34.170.111.111/")
    print(r.content)

