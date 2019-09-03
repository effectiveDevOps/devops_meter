# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
```
>> ./bin/rails db:create db:migrate
```

* Database initialization
```
>> docker run --name dev-postgres -p 15432:5432 -e POSTGRES_USER=dev -e POSTGRES_PASSWORD=postgres -d postgres:11

>> psql -h localhost -U dev-postgres
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
