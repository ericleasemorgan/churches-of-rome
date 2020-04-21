# Churches of Rome

This suite of tools -- Churches of Rome -- is used to transform an XML file into a database and then report on the contents of the database. Like all software, the suite is never finished. That said, this is how the whole thing works:

   1. Given an XML file of a specific shape ([roman-churches.xml](./etc/roman-churches.xml)), extract church identifiers, church names, and church pages. Output the identifiers and names as a set of [SQL insert statements](./tmp/inserts.sql). Output the pages as [plain text files](./pages).
   
   2. Given the insert statements, create and initialize an [SQLite database](./etc/roman-churches.db).
   
   3. Given the plain text files, extract metadata ("infobox" content), and output sets of [SQL update statements](./tmp/updates.sql). Update the database.
   
   4. Dump the database as a [CSV file](./etc/roman-churches.csv).
   
   5. Summarize the content of the database, and save it to a file ([summary.txt](./summary.txt)).

After cloning this repository, and assuming a sane Linux computing environment, a person can do all of the above with a single command: [`./bin/build.sh`](./bin/build.sh)

## Next steps

The next steps are multiple and listed in no priority order:

   * geolocate - Additional fields can be added to the [database schema](./etc/schema.sql) to include latitude and longitude, and a new script could be written to update those values.
   
   * normalize - Many of the values in the fields are not consistent and thus queries are not accurate; use something like OpenRefine to normalize content.
   
   * import narratives - So far, only metadata describing each church is included the database and the narratives need/ought to be imported as well. On the other hand, the narrative content is marked up in some way, and maybe we could use it directly.
   
   * enhance database - Consider creating a field called "century" and another one called "year", and then derive the values of those fields based on the values in the field named "built". Once done, a timeline could be created. Similarly, consider creating an additional table called "architects", populate the table with the names of architects, and populate the table with URLs pointing to descriptions of the architectes. Once done, the architects could be put into context.
   
   * index - Create a Solr instance, loop through the database to fill the Solr instance, and once done provide a full text index complete with faceted browse.
   
Again, software is never done, and if it were, then it would be called "hardware".

---  
Eric Lease Morgan &lt;emorgan@nd.edu&gt;  
April 21, 2020
