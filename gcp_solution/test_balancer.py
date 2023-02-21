import requests

while 1:
    r = requests.get("http://34.68.24.235/")
    print(r.content)

