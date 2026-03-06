# pharmacy_db
## This is a simple database application for a pharmacy where they can track patients, doctors, medicine manufacturers, medicine suppliers, and medicine
### I am using a macbook with Postgres.app, so to start create the database using the command:
```
psql -d postgres -f init.sql
```
### This command will create the database pharmacy_db, connect to that database, create user pharm_user and grant them privileges, then create all necessary tables
### Following this, insert some fake data into the database. First, switch to the sql_data directory using the command:
```
cd ./sql_data
```
### Then, use the following command to populate the tables:
```
psql -d pharmacy_db -f data.sql
```
### Finally for the application functionality, switch back to the pharmacy_db directory using cd .. and run the command:
```
python3 pharm_app.py
```
### MAKE SURE THAT THE DATA YOU INPUT FOR patient ID AND medicine ID MATCH WHAT IS ALREADY IN THE DATABASE OR ELSE YOU VIOLATE CONSTAINTS!