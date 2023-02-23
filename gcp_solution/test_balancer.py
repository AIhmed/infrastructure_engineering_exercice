import requests

while 1:
    r = requests.get("http://35.226.178.138/")
    print(r.content)

