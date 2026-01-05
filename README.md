 Hi I'm Bharath Reddy

End-to-End Data Engineering Pipeline using| AWS | Snowflake | Python | SQL  

## Project Overview:

This project implements an end-to-end, cloud-native ETL pipeline that extracts music data from the Spotify API, transforms it using AWS Lambda and Python, and loads it into Snowflake using Snow pipe for near real-time analytics.

1. Designed and implemented an end-to-end ETL pipeline using Spotify API, AWS, and Snowflake

2. Extracted real-time music data from Spotify API in JSON format

3. Built AWS Lambda functions in Python for data transformation using Pandas

4. Converted raw JSON data into structured CSV files

5. Implemented a multi-layer S3 architecture (raw, processed, transformed)

6. Automated file movement and data lifecycle management in Amazon S3

7. Designed Snowflake tables for artists, albums, and songs datasets

8. Implemented Snow pipe for near real-time, event-driven data ingestion

9. Handled schema mismatches, data type conversions, and ingestion errors

10. Enabled scalable and production-ready cloud data workflows



## Skills & Technologies :
- Programming: Python, SQL
- Cloud: AWS (S3, Lambda, CloudWatch, IAM)
- Data Warehousing: Snowflake
- ETL & Pipelines: Snow pipe, Event-driven ingestion
- Data Formats: JSON, CSV
- Tools: Git, GitHub, Pandas


## Data Flow :
1. Spotify API data is fetched in JSON format
2. Raw JSON stored in S3 (raw_data/to_processed)
3. Lambda transforms JSON → CSV
4. Transformed CSV stored in S3 (transformed_data)
5. Snow pipe automatically ingests CSV into Snowflake tables

1. s3://spotify-etl-project-123/
   1.1 raw_data/
       1.1.1 to_processed/
       1.1.2 processed/
   1.2 transformed_data/
       1.2.1 artist_data/
       1.2.2 album_data/
       1.2.3 songs_data/

Thank you 
MADA Bharath Reddy.
