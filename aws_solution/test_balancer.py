import requests
import time

start_time = time.time()
delta = round(time.time() - start_time)
while delta <= 90:
    r = requests.get("http://web-app-load-balancer-355003998.us-east-1.elb.amazonaws.com/")
    print(f"{r.content} \t \t \t {delta}")
    delta = round(time.time() - start_time)

