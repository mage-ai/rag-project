import requests
import json
from typing import List, Dict


@data_loader
def ingest_api_data(*args, **kwargs) -> List[Dict]:
    endpoint = kwargs.get('endpoint')

    response = requests.request(method='GET', url=endpoint)
    response.raise_for_status()

    return [response.json()]