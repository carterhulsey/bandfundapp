# Bandfund

_Bandfund helps musicians connect with their fans more easily and provides a platform for the fans to fund the musicians to focus on their music and not have to worry about working to pay the bills._

## Project Setup

1. `$ git clone git@github.com:bandfundapp/bandfundapp.git`
2. `$ cd bandfundapp`
3. `$ cp .env.example .env`
4. `$ cp config/database.example.yml config/database.yml`
5. `$ rake db:migrate`
6. `$ git remote add staging git@heroku.com:bandfundapp-staging.git`
7. `$ git remote add production git@heroku.com:bandfundapp.git`

You may have to generate SSH keys for Heroku. A guide for this can be found [here](https://devcenter.heroku.com/articles/keys).

### Third Party

1. Facebook: _create a facebook app, put those keys in the .env file_
  Test Accounts
  * Development:
    ksprlqq_qinberg_1412096949@tfbnw.net / password
    ypbgcvs_liescu_1412095770@tfbnw.net / password
  * Staging:
    maria_phusobi_greeneman@tfbnw.net / password
    dave_xmqmqdo_panditescu@tfbnw.net / password
1. Stripe:

  _create a Stripe app, put those keys in the .env file_

  Fans can pay via Stripe with their Credit Card.  They will enter their credit card information first,
  and subsequent times they will be able to just click the 'Pledge' button

  Artists are required to connect their Stripe account to their BandFundApp account
  before they are able to create Rewards for htheir fans

1. S3: _create a bucket, put those keys in the .env file_

## Deploying

### _How to setup the deployment environment_

* Production

  - Heroku: bandfundapp

* Staging

  - Heroku: bandfundapp-staging

### _How to deploy_

* Production:

  `$ git push production master`

* Staging:

  `$ git push staging master`

## Troubleshooting & Useful Tools

#### Set the Featured Artist via commandline

- `$ heroku run rake artist:featured ID=<id of artist> -a <herokuapp name>`

#### Deleting Users

First, access the Heroku console: `$ heroku run console -a bandfundapp`
Remove all artists: `#> Artist.destroy_all`
Remove all fans: `#> Fan.destroy_all`
Remove specific artist: `Artist.find(<id of artist>).destroy`
Remove specific fan: `Fan.find(<id of artist>).destroy`



#### Set heroku plugins to use

- `$ rails plugins install git://github.com/ddollar/heroku-config.git`

- `$ heroku config:pull -a <env>`

- `$ heroku config:push -a <env>`

## Making changes

_In order to keep the site working smoothly, please follow this protocol when pushing changes:_


1. Pull most recent version of repo from Github `$ git pull`
2. Make your changes
3. Add your changes `$ git add .`
4. Commit your changes `$ git commit`
5. Push to staging app `$ git push staging master`
6. Test changes on <http://bandfundapp-staging.heroku.com>
7. Push to <https://github.com/smfahrig/bandfundapp> `$ git push`
8. Push to production app `$ git push production master`
9. Celebrate your accomplishment!

## Team

#### Internal
Scott Fahrig <scott@bandfund.com>

#### External
Corey Grusden <cgrusden@divergentsoftware.com>
