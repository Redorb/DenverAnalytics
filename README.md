# Denver Analytics
### Steps
1. Unzip the clean.csv.zip to the directory.
2. Run bundle and rake db:migrate.
3. Import the data into the database with rake data_migration:partial_bulk_csv_import. There are a few other options for systems with large amounts of ram or potato machines that you can also try.
4. Run rails s
5. Navigate to localhost and click Data Viz to create a graph.
6. If you find better graphs for the data sets let me know!

### Info
Above you'll fine a link called Viz Data which will let you query the Denver 311 Data set for the
time of 8/2014 to 8/2015. I've done my best with cleaning the available data and offering graphs
that best help visualize the data. However due to the large data set and groupings certain combinations
are hard to read, if a better graph is known feel free to suggest it and I'll make the necessary changes.
I refer to the data records a lot as complaints but a more neutral term would probably have been better.

### Key Takeaways
* The fall/early winter months have the least number of complaints for the most part.
* The first police district has the highest number of complaints.
* Montebello and Gateway neighborhoods have the highest number of complaints.
* The main area by far for complaints is in customer service.
* Most complaints are for information.
* Most of these information complaints are for vehicle registration.
