# my-esporifai

## Status

This repo is retired as an active data/app pipeline. It is kept as a historical
Esporifai data repository and export-history source for the Spotify repo
migration.

Current canonical listening data now lives in
[`chekos/my-spotify-data`](https://github.com/chekos/my-spotify-data). Current
analytics and GitHub Pages output live in
[`chekos/my-spotify-analytics`](https://github.com/chekos/my-spotify-analytics).

`my-spotify-data` still reads this repo's historical `history.json` and
`streaming_history.json` inputs when rebuilding the no-data-loss canonical
audit, so do not archive or delete this repo while that dependency remains.

GitHub Actions in this repo are retained only for recovery reference and should
remain disabled unless there is an intentional historical rebuild or export
recovery task.
