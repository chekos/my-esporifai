import os
import json
import urllib.parse
import urllib.request
from pathlib import Path


PRIMARY_KEYS = {
    "albums": "id",
    "artists": "id",
    "history": "played_at",
    "streaming_history": "played_at",
    "tracks": "id",
}


# Following tutorial: https://www.datasette.cloud/blog/2023/datasette-cloud-api/
# Sending records
def fetch_records(filename: str | Path):
    with open(filename, "r") as file:
        records = json.load(file)

    return records


def send_records(records, table, api_token):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {api_token}",
    }
    body = {
        "table": table,
        "rows": records,
        "pk": PRIMARY_KEYS[table],
        "ignore": True,
    }

    req = urllib.request.Request(
        "https://esporifai.datasette.cloud/data/-/create",
        data=json.dumps(body, default=str, ensure_ascii=False).encode("utf-8"),
        headers=headers,
        method="POST",
    )
    with urllib.request.urlopen(req) as response:
        print(table, response.status, len(records))


def save_records(filename: str | Path, api_token):
    if isinstance(filename, str):
        filename = Path(filename)

    table = filename.stem

    batch = []
    for record in fetch_records(filename):
        batch.append(record)
        if len(batch) == 100:
            send_records(batch, table, api_token)
            batch = []
    if batch:
        send_records(batch, table, api_token)


if __name__ == "__main__":
    token = os.environ.get("DATASETTE_API_TOKEN")
    for filename in [
        "tracks.json",
        "albums.json",
        "artists.json",
        "history.json",
        "streaming_history.json",
    ]:
        save_records(filename, token)
