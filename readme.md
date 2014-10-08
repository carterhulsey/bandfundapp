# BandFund App

### Integrations: 
All API keys are located in `.env`

  * AWS s3
    * Stores Artists uploaded images
  * Facebook 
    * `gem 'omniauth-facebook'`
    *  Allows Artists and Fans to Signup or Login with Facebook
    * `app/controllers/artits/devise/omniauth_callbacks_controller` and `app/controllers/fans/devise/omniauth_callbacks_controller` control when Fans or Artists signup or login.
  * Stripe
    * `gem 'stripe'`
    * Stripe is set up to allow Artists to connect their stripe account and create "plans", also known as "rewards"  After a reward is created, a Fan is then allowed to make a pledge.  When A pledge is created, we save all of the information needed about the transaction into our database in the pledge table.  
    * `app/controllers/pledges_controller#37` is where we decide what percentage of the pledge we're going to take. `:application_fee_percent => 20` 
  
  