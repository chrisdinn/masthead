# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_masthead_session',
  :secret      => '39b4f5089fd2c227e733dfc49886abe6ea191414bf9b24843e7c15d82acfbc6e7c57152069198a35602d2d7e5bf74f85c0495d252854cef16a40789707838306'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
