#!/bin/bash

jq --compact-output --sort-keys '[ .[] | select( .spotify_track_uri != null ) | select(.spotify_track_uri | contains("spotify:track")) | { "id": (.spotify_track_uri | ltrimstr("spotify:track:")), "played_at": .ts}]' full-history/MyData/streaming_history.json > streaming_history.json

sqlite-utils insert spotify.db streaming_history streaming_history.json --pk id --pk played_at --ignore

sqlite-utils insert spotify.db full_history full-history/MyData/streaming_history.json --pk ts --ignore