import requests

while 1:
    r = requests.get("http://35.206.99.227/")
    print(r.content)

