import requests

while 1:
    r = requests.get("http://34.67.37.71/")
    print(r.content)

