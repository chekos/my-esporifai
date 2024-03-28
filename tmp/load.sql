COPY history FROM 'tmp/history.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
COPY albums FROM 'tmp/albums.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
COPY artists FROM 'tmp/artists.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
COPY tracks FROM 'tmp/tracks.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
COPY streaming_history FROM 'tmp/streaming_history.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
COPY full_history FROM 'tmp/full_history.csv' (FORMAT 'csv', quote '"', delimiter ',', header 1);
