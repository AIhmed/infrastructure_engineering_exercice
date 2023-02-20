import os
import json
current_sys_user = os.getlogin()
with open(f"/home/{current_sys_user}/google_cloud_credentials.json", "r") as json_file:
    credentials = json.load(json_file)
    os.environ["TF_VAR_project_id"] = credentials["project_id"]
    print(credentials["project_id"])
    os.environ["TF_VAR_region"] = "us-central1"
