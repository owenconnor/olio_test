# README

## Setup
In order to run this application locally you'll need to follow these steps:

### Clone the application from github
Within your terminal navigate to the directory where you wish to save the application locally and type
`git clone git@github.com:owenconnor/olio_test.git`
That command will save the application into the folder "olio_test".
Navigate into that directory.

### Bundle
In order to ensure that the gems used in the application are installed locally and up to date the Bundler tool is used. Type the command `gem install bundler`.
If successful follow that with the command `bundle install`. This will install the required gems (libraries) on your system.

### Configure the Database
From within that directory type the command `rails db:test:create` in order to set up a SQLite Database which you can use locally for viewing the app.
After that use the command `rails db:migrate` to update the database structure to the schema required for the application to function.

### Start the server
To start the rails server type `rails s` in the terminal. This will create a rails server and enable you to use the application via the browser.

### Navigate in Browser
In your browser navigate to `http://localhost:3000/olio_items/index`. You should see a list of Olio items which you can look over. You can choose to add a "like" to any Olio item by clicking the like button on any item.

## Additional options

### Tests
A number of tests have been written in order to ensure the application operates as intended. And should any changes be made which break it we are warned.
if you widh you can run the tests by using the command `rspec`

### Documentation
Some basic documentation has been complied for this application and you can view it by using a tool called Yard. If you run the command `yard` followed by `yard server` and navigate to `http://localhost:8808` in you browser you can navigate the documentation.
