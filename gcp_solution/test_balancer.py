import requests
import time

start_time = time.time()
delta = round(time.time() - start_time)
count = 0
while delta <= 90:
    r = requests.get("http://34.95.79.65/")
    print(f"{r.content} \t \t \t {delta}")
    delta = round(time.time() - start_time)
    count += 1
print(f"total number of requests per minute in google cloud is {count}")
