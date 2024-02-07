#!/bin/bash

jq '[.[] | select(.explicit == false)]' tracks.json > tracks_cleaned.json


jq -s '[.[0][] | .played_at |= sub("\\.[0-9]+"; "")] + [.[1][] | .played_at |= sub("\\.[0-9]+"; "")]' history.json streaming_history.json > combined_history.json


jq 'sort_by(.played_at)' combined_history.json > sorted_history.json


# only the clean tracks
jq '[.[].id]' tracks_cleaned.json > non_explicit_track_ids.json

jq --slurpfile ids non_explicit_track_ids.json '.[] | select([.id] | inside($ids[]))' sorted_history.json > streaming_history_cleaned.json
