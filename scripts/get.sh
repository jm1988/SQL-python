#!/bin/bash
#This commands will sort the file by the CONLISION_ID in ascending order and them will create a file with only 10000 records.
head -n 1 ../data/Motor_Vehicle_Collisions_-_Vehicles.csv > ../data/vehicle.csv
tail -n+2 ../data/Motor_Vehicle_Collisions_-_Vehicles.csv | sort --numeric-sort --reverse --field-separator=',' --key=2 | head -n 10000 >> ../data/vehicle.csv
head -n 1 ../data/Motor_Vehicle_Collisions_-_Person.csv > ../data/person.csv
tail -n+2 ../data/Motor_Vehicle_Collisions_-_Person.csv | sort --numeric-sort --reverse --field-separator=',' --key=2 | head -n 10000 >> ../data/person.csv
head -n 1 ../data/Motor_Vehicle_Collisions_-_Crashes.csv > crash.csv
tail -n+2 ../data/Motor_Vehicle_Collisions_-_Crashes.csv | sort --numeric-sort --reverse --field-separator=',' --key=24 | head -n 10000 >> ../data/crash.csv