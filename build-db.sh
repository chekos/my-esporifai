#!/bin/bash

## get data 
curl -o tracks_history.json https://raw.githubusercontent.com/chekos/my-recently-played-tracks/main/tracks.json

## history
jq --compact-output --sort-keys '[ .[] | { "played_at": .played_at, "id": .track.id, } ] | sort_by(.played_at)' tracks_history.json > history.json

## albums
jq --compact-output --sort-keys '[ .[] | .track.album | del(.available_markets) ] | unique_by(.id)' tracks_history.json > albums.json

## artists
jq '[ .[] | .track.album | del(.available_markets) | .artists ] | flatten | unique_by(.id)' tracks_history.json > artists.json

## tracks
jq --sort-keys '[ .[] | .track + {artist_ids: .track.artists[] | [.id], album_id: .track.album.id} | del(.available_markets) | del(.album) | del(.artists) ] | unique_by(.id)' tracks_history.json > tracks.json

## build db
sqlite-utils insert spotify.db history history.json --pk id --pk played_at --ignore
sqlite-utils insert spotify.db albums albums.json --pk id --alter --ignore
sqlite-utils insert spotify.db artists artists.json --pk id --alter --ignore
sqlite-utils insert spotify.db tracks tracks.json --pk id --alter --ignore
sqlite-utils vacuum spotify.db

## add views
sqlite3 spotify.db '.read scripts/load-scripts.sql'
