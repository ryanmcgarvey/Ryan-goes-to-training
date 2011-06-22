# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_servo_session',
  :secret      => 'fd1b07c6c08670a2b6c3d1047d3c64938c1d8e40dc016b9e7d8479bd441697be5b46be56d148f79643bdc550b89c30f055f84a1520d4020f3853192c8b2ce121'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
