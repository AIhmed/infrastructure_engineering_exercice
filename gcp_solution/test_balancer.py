import requests

while 1:
    r = requests.get("http://34.111.169.97/")
    print(r.content)

