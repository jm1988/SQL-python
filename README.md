## Python Pandas and SQL Integration

The goal of this project is to show the possibilities of using SQL statements to perform data extraction within python. 

SQL has some advantages over  traditional data extraction tools such as pandas; it uses an easier to understand syntax, the statements are more readable and it allows the transformation of data in one single statement.

Pandasql which is the code that integrates pandas tables to be manipulated by SQL statements used SQLite; a database management system which offer basic capabilites and thus has many limitations.

### Getting and Preparing the data

The data was downloaded from the [NYC Open Data website](https://opendata.cityofnewyork.us/) and is comprised of 3 related datasets about motor vehicle collisions:
* [MVC Crashes](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95)
* [MVC Person](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Person/f55k-p6yu)
* [MVC Vehicles](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Vehicles/bm4k-52h4)

The 3 datasets were downloaded into the data folder each of the files are over 300 megabytes in size.

Due to the size of this datasets, it's not possible to load all of them into python as the amount of memory required is sustantial and it would slow down any system.

For the above mention reason, I decided to utilize a sample of the data, I picked 10,000 records for each file. The best way of doing this without using python, it's by using the command line (on linux, in this case I used Ubuntu 18). Creating a bash script to perform the extraction of records into new files.

For example:

```
head -n 1 bigdata.csv > sample.csv
tail -n+2 bigdata.csv | sort --numeric-sort --reverse --field-separator=',' --key=2 | head -n 10000 >> sample.csv
```
The first line extract the header from the dataset and create a new file just with it. The second line extract all the records except the header then it sorts on descending order the records base on the column or key (in this example it does using the *second column) and then only take the first 10,000 records and then paste into the sample file below the header created on the first line.

*In this case the sorting column is the one with collision ID which is the one that related all the datasets, in order to make sure that the ID appears in all the samples.

### Loading the Tables and Start Querying

In all the datasets were loaded into python using pandas read_csv function and then used on the SQL statements using pandasql.
The example can be seen in the notebook.
