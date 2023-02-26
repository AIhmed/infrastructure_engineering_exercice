import requests
import time

start_time = time.time()
delta = round(time.time() - start_time)
count = 0
while delta <= 60:
    r = requests.get("http://web-app-load-balancer-895374282.us-east-1.elb.amazonaws.com/")
    print(f"{r.content} \t \t \t {delta}")
    delta = round(time.time() - start_time)
    count += 1
print(f"total number of request per minute in amazon web services is {count}")
