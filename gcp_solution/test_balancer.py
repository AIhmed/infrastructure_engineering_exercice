import requests

while 1:
    r = requests.get("http://34.66.121.135/")
    print(r.content)

