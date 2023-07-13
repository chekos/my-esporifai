#!/bin/bash

jq --compact-output --sort-keys '[ .[] | select( .spotify_track_uri != null ) | select(.spotify_track_uri | contains("spotify:track")) | { "id": (.spotify_track_uri | ltrimstr("spotify:track")), "played_at": .ts}]' full-history/MyData/streaming_history.json > streaming_history.json

sqlite-utils insert spotify.db history streaming_history.json --pk id --pk played_at --ignore