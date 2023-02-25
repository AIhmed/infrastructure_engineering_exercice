import requests
import time

start_time = time.time()
delta = round(time.time() - start_time)
while delta <= 90:
    r = requests.get("http://34.149.56.23:80/")
    print(f"{r.content} \t \t \t {delta}")
    delta = round(time.time() - start_time)

