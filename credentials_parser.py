import os
import json
current_sys_user = os.getlogin()
cred_file = f"./google_cloud_credentials.json"
with open(cred_file, "r") as json_file:
    credentials = json.load(json_file)
    print(credentials["project_id"])
