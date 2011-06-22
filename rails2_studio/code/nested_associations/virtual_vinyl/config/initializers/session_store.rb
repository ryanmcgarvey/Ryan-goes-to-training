# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_virtual_vinyl_session',
  :secret      => '4ab497492d197f691406823b0731e0487cde3c3dcb3c8eb3107d51a6ebfac34c96665e6adb1c3d3998dbac4722dc62709fe1d40db365d3dc00f0084d9319a525'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
