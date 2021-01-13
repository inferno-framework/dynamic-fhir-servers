# README

The fhir-api provides a dynamic server for handling get/search requests based on user provided json data in the form of the implementation guide that contains a capability statement

## REST API:

### GetById

Ability to search for specific resources by id and get data back based on example json data provided for that resource

#### Route:

GET /resource/id

#### Response:

resource JSON

### Search

Ability to query with various valid parameter combinations and get data back based on example json data provided for that resource

#### Route:

GET /resource?queryParameters

#### Response:

resource JSON

#### Requires:

fhir-validator-wrapper running in the background found at: https://github.com/inferno-community/fhir-validator-wrapper

### Create

#### Route:

POST /resource BODY: Must contain "id", "resource_type", "resource"

#### Reponse:

created resource JSON

### Delete

#### Route:

DELETE /resource/id

#### Reponse:

successfully deleted resource with specified id

### Update

#### Route:

PUT /resource/id BODY: Must contain valid JSON to be stored in resource column

#### Reponse:

successfully updated resource with specified id

## System dependencies

Requires PostGreSQL installed 1.2.3 or above

Requires Ruby version 2.7.2

Requires Rails 6.0.3.4

## Configuration
Assumes default PostGreSQL username/password, can be modified in the config/Database.yml file as needed

### Windows PostGreSQL Tips
If you don't know the username/password of the postgre installed on your OS, uninstalling and reinstalling will
be the easiest way to reset it. The default credentials are username: postgres password: null

### MAC PostGreSQL Tips
```shell script
brew update
brew install postgresql
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres start
pg_ctl -D /usr/local/var/postgres stop
```
## Database creation - this ideally will be simplified in the future to be one command that can run on startup without user interaction

```shell script
rake db:create
rake db:structure:load
# To load json example data from <Ruby Root>/db/seeds/package/example/
rake db:seed json_file='package'
# To load json data from Synthea from <Ruby Root>/db/seeds/synthea
rake db:seed json_file='synthea'
```

## Running Locally

### Initial Setup Commands

```shell script
bundle install
```

### Starting up server each time

```shell script
rails s
```

#### Note: https://github.com/inferno-community/fhir-validator-wrapper must be running on port 4567 if using search commands

## Running in Docker

To run this service in Docker, run the following commands in the `dynamic-fhir-servers` directory:
* `docker-compose up --build`
* (once the prior command has started all the containers): `docker-compose run dfs bin/setup_db.sh`

### Rails port configuration

The docker-compose configuration maps the rails endpoint to port `3000` on the host machine.

To change this, change the `ports` line in the `dfs` entry in `docker-compose.yml` from `- "3000:3000"` to `- "<your_desired_port>:3000"`, and restart the containers.

For example: `- "8080:3000"` will map the rails endpoint to port `8080` on your machine.

The docker-compose maps the `package` and `synthea` directories in `db/seeds` into the container. Re-running `docker-compose run dfs bin/setup_db.sh` after changing those directories (and restarting the `dfs` container by running `docker-compose restart dfs`) will re-seed the database with the new structure. To clear the old structure prior to reloading, run `docker-compose run dfs bin/rake db:drop`.
