# yoga_studio :lotus_position_woman:
CodeClan Ruby Project


### How to run the application

* Open your terminal and type `drobdb yoga_studio` to drop any Database you might have with the name yoga_studio
* Create a new Database called yoga_studio `createdb yoga_studio`
* Run the following command `psql -d yoga_studio -f db/yoga_studio.sql` to initialize the Database
* At this point the Database is empty, pass in some information by running the seeds.rb file `ruby db/seeds.rb`
* Run `ruby app.rb` to create a server
* In the last line in your terminal you will see the port number for the server
* Open your favourite browser and type the URL localhost: followed by the port number

### The brief 

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

The user should be able to:

* Create and edit Members
* Create and edit Classes
* Book members on specific classes
* See a list of all upcoming classes
* See all members that are booked in for a particular class

### Extensions

* Classes could have a maximum capacity, and users can only be added while there is space remaining.
* The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.
* The Gym could mark members and classes as active/deactivated. Deactivated members/classes will not appear when creating bookings.

### Technologies used

* Ruby
* Sinatra
* SQL

### Reflection

I created a dynamic timetable that displays all sessions and automatically adds a new session into the correct slot. However, one of the constraints was not to use any Ruby frameworks or libraries other than Sinatra. My solution was a nested for loop so that each cell contains the information about their specific day and time. Each cell then makes a request to the database to see if a session with this specific time slot exists and if so displays the data. Even though I am really proud of this functionality, I have to say that the more entries the database has the more it affects the application’s performance.

The homepage shows the dynamic timetable once open:

![](images/timetable1.png)

![](images/timetable2.png)

The menu on the left allows the user to visit other sites and use more functionalities such as viewing all yoga classes.

![](images/all_classes.png)
