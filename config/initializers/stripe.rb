Rails.configuration.stripe = {
  :test_publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :test_secret_key      => ENV['STRIPE_TEST_SECRET_KEY'],
  :live_publishable_key => ENV['STRIPE_LIVE_PUBLISHABLE_KEY'],
  :live_secret_key => ENV['STRIPE_LIVE_SECRET_KEY'],
}

Stripe.api_key = Rails.configuration.stripe[:live_secret_key]
