USE DATABASE AWS_DATABASE;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE table_artists(
    artist_id VARCHAR,
    artist_name VARCHAR,
    artist_url VARCHAR
);


CREATE OR REPLACE TABLE table_albums (
    album_id VARCHAR,
    album_name VARCHAR,
    release_date DATE,
    tracks INT,
    album_url VARCHAR
);

CREATE OR REPLACE TABLE table_songs (
    song_id VARCHAR,
    song_name VARCHAR,
    duration_ms INT,
    song_url VARCHAR,
    popularity INT,
    song_added DATE,
    album_id VARCHAR,
    artist_id VARCHAR
);

CREATE OR REPLACE FILE FORMAT csv_format
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1;

CREATE OR REPLACE SCHEMA external_stages;

CREATE OR REPLACE STAGE external_stages.aws_stage
URL = 's3://spotify-etl-project-123/'
CREDENTIALS = (
    AWS_KEY_ID = <AWS_ACCESS_KEY_ID>
    AWS_SECRET_KEY = <AWS_SECRET_ACCESS_KEY>
);

COPY INTO table_artists
FROM @external_stages.aws_stage/transformed_data/artist_data/
FILE_FORMAT = csv_format
FORCE = TRUE;



COPY INTO table_albums
FROM @external_stages.aws_stage/transformed_data/album_data/
FILE_FORMAT = csv_format
FORCE = TRUE;



COPY INTO table_songs
FROM @external_stages.aws_stage/transformed_data/songs_data/
FILE_FORMAT = csv_format
FORCE = TRUE;


CREATE OR REPLACE PIPE pipe_artists
AUTO_INGEST = TRUE
AS
COPY INTO table_artists
FROM @external_stages.aws_stage/transformed_data/artist_data/
FILE_FORMAT = csv_format;


CREATE OR REPLACE PIPE pipe_albums
AUTO_INGEST = TRUE
AS
COPY INTO table_albums
FROM @external_stages.aws_stage/transformed_data/album_data/
FILE_FORMAT = csv_format;


CREATE OR REPLACE PIPE pipe_songs
AUTO_INGEST = TRUE
AS
COPY INTO table_songs
FROM @external_stages.aws_stage/transformed_data/songs_data/
FILE_FORMAT = csv_format;


ALTER PIPE pipe_artists REFRESH;
ALTER PIPE pipe_albums REFRESH;
ALTER PIPE pipe_songs REFRESH;



SHOW PIPES;

SELECT COUNT(*) FROM table_artists;
SELECT COUNT(*) FROM table_albums;
SELECT COUNT(*) FROM table_songs;

