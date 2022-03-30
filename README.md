# RecruitersAPP

[https://github.com/gguedine/recruiters_app](https://github.com/gguedine/recruiters_app)

## Install

### Clone the repository

```shell
git clone https://github.com/gguedine/recruiters_app
cd recruiters_app
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby-2.7.2`

If not, install the right ruby version using [rvm](https://rvm.io/rvm/install) (it could take a while):

```shell
rvm install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle 
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a recruiters-app-staging
heroku git:remote --remote heroku-staging -a recruiters-app-staging
heroku git:remote --remote heroku-production -a recruiters-app-production
```

## Server

```shell
rails s
```

## Running test

All tests:
```shell
rspec spec
```
Specific test
```shell
rspec <file_path>
```
## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a recruiters-app-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```

## Heroku setup

```shell
heroku run rake db:migrate db:seed --app recruiters-app-staging
```
or
```shell
heroku run rake db:migrate db:seed --remote heroku-staging
```