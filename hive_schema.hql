
Create database crimes;
Use crimes;

create table if not exists gun_crime (id_ INT,crime_date DATE,state STRING,
city_or_county STRING,address STRING,n_killed SMALLINT ,
n_injured SMALLINT,incident_url STRING,source_url STRING,
incident_url_fields_missing STRING,congressional_district STRING,gun_stolen STRING,
gun_type STRING,
incident_characteristics STRING,latitude STRING,location_description STRING,
longitude STRING,n_guns_involved SMALLINT,notes STRING,participant_age STRING,
participant_age_group STRING,participant_gender STRING,participant_name STRING, participant_relationship STRING, participant_status STRING, participant_type STRING, sources STRING,
state_house_district STRING, state_senate_district STRING) 
COMMENT 'Gun Crimes table'
row format delimited 
fields terminated by ','
LINES TERMINATED BY '\n' 
stored as textfile
LOCATION '/user/hive/warehouse/crimes.db/gun_crime'
tblproperties ('skip.header.line.count'='1');


LOAD DATA INPATH '/input/stage4.csv'
OVERWRITE INTO TABLE gun_crime;




create table if not exists population
(rank INT,state STRING,
pop BIGINT,growth DOUBLE,pop18 BIGINT,pop10 BIGINT,growth10 DOUBLE,perc DOUBLE,density DOUBLE)
COMMENT 'Population Table'
row format SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    separatorChar  =  "," ,
    quoteChar      =  \""  
)
stored as textfile
LOCATION '/user/hive/warehouse/crimes.db/population'
tblproperties ('skip.header.line.count'='1')

LOAD DATA INPATH '/input/population.csv'
OVERWRITE INTO TABLE population;