import os
import shutil
from requests.exceptions import RequestException

import kagglehub

target_path = os.path.join(os.getcwd(), "data")

if os.path.exists(target_path):
    print(f"Folder already exists at location: {target_path}, skipping download")
else:
    try:
        cache_path = kagglehub.dataset_download("olistbr/brazilian-ecommerce")
        shutil.move(cache_path, target_path)
    except FileNotFoundError:
        print("Dataset not found, check the slug.")
    except RequestException:
        print("Request exception occurred, perhaps some network issues?")
    finally:
        print("Action (gather_data) ended.")