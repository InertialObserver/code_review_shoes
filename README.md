Epicodus student project: 

This is a small app to track inventory of shoes in shoe stores.

To use:

Clone git repo

Run the following command: bundle install

Set up ActiveRecord database:

Start Postgres

In bash type rake db:create db:migrate db:test:prepare

Confirm databases are set up as expected using the psql window in bash

To use the app:

Run ruby app.rb 
Navigate in your browser to localhost:4567

Known Bugs

Does redirect to "Error" page when a blank form is submitted from the home page, but not when blank forms are submitted from other pages as those paths are not written yet.

Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug. We also encourage you to help even more by forking and sending us a pull request.

LICENSE

MIT License. Copyright 2015
