CREATE SCHEMA IF NOT EXISTS main;



CREATE TABLE history(id VARCHAR, played_at VARCHAR, PRIMARY KEY(id, played_at));
CREATE TABLE albums(album_type VARCHAR, artists VARCHAR, external_urls VARCHAR, href VARCHAR, id VARCHAR PRIMARY KEY, images VARCHAR, "name" VARCHAR, release_date VARCHAR, release_date_precision VARCHAR, total_tracks BIGINT, "type" VARCHAR, uri VARCHAR, album_group VARCHAR, is_playable BIGINT);
CREATE TABLE artists(external_urls VARCHAR, href VARCHAR, id VARCHAR PRIMARY KEY, "name" VARCHAR, "type" VARCHAR, uri VARCHAR);
CREATE TABLE tracks(album_id VARCHAR, artist_ids VARCHAR, disc_number BIGINT, duration_ms BIGINT, explicit BIGINT, external_ids VARCHAR, external_urls VARCHAR, href VARCHAR, id VARCHAR PRIMARY KEY, is_local BIGINT, "name" VARCHAR, popularity BIGINT, preview_url VARCHAR, track_number BIGINT, "type" VARCHAR, uri VARCHAR);
CREATE TABLE streaming_history(id VARCHAR, played_at VARCHAR, PRIMARY KEY(id, played_at));
CREATE TABLE full_history(ts VARCHAR PRIMARY KEY, username VARCHAR, platform VARCHAR, ms_played BIGINT, conn_country VARCHAR, ip_addr_decrypted VARCHAR, user_agent_decrypted VARCHAR, master_metadata_track_name VARCHAR, master_metadata_album_artist_name VARCHAR, master_metadata_album_album_name VARCHAR, spotify_track_uri VARCHAR, episode_name VARCHAR, episode_show_name VARCHAR, spotify_episode_uri VARCHAR, reason_start VARCHAR, reason_end VARCHAR, shuffle BIGINT, skipped VARCHAR, offline BIGINT, offline_timestamp BIGINT, incognito_mode BIGINT);










