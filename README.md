# TwitterSpace

## Running the project
This project utilizes the latest versions of Docker and Docker Compose. Please make sure your system is at least somewhat up to date with the most recent version of both.

### Starting the containers
The first time you clone down and run the project will require a little bit of initialization work. You will need to build the web server and database images as well a create the development and test databases within the database container. These actions only need to be completed the first time the project is run and can be skipped for all subsequent restarts of the web and database containers.  
**Building from scratch:**
- `docker-compose build`
- `docker-compose up`

In order to create the development and test database you will need to open a new terminal window and run either:  

- `docker-compose run web rake db:create`  
- `docker-compose run web rake db:migrate`  
or  
- `docker exec -it web bash`
- `rake db:create && rake db:migrate`

At this point you should be able to view the project at `localhost:3000`. Simply login/register and start creating new posts.

**Subsequent restarts:**
- `docker-compose up`

## Running the test
Testing is composed of RSpec tests with coverage visible via SimpleCov.  

Call `docker-compose run web rspec` to run the tests and then open up `coverage/index.html` in your browser to view the coverage results

## Running the linters
Linting of this project is composed of a set of 5 linters run in sequence: Rails Best Practices, RuboCop, Reek, Flog, Flay.  
To run all of the linters simply call `docker-compose run web ./lint`