# yoga_studio
CodeClan Ruby Project


### How to run the application:

* Open your terminal and type `drobdb yoga_studio` to drop any Database you might have with the name yoga_studio
* Create a new Database called yoga_studio `createdb yoga_studio`
* Run the following command `psql -d yoga_studio -f db/yoga_studio.sql` to initialize the Database
* At this point the Database is empty, so we now need to pass in some information by running our seeds.rb file `ruby db/seeds.rb`