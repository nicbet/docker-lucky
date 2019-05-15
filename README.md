# docker-lucky
Dockerized Development Environment for Crystal/Lucky Framework

## Getting Started
- Clone this repository
- Init a new app `./lucky init`
- Move the code from `./src/<appname>` to `./src`
- Edit `./src/config/database.cr` and change `hostname` to `db`
- Run the setup script `./run script/setup`
- Fire up your app with `docker-compose up` and access it at http://localhost:5000