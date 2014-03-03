# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Boozebox::Application.config.secret_key_base = ENV['APP_SECRET_TOKEN'] || '5324f6b3afa0ca7396341a99c77aaacb1f5994e3c829ad545275b039a9f47cd27694392b0c8b4a312bfc9b0bcb5818d38d17d44f2bc07b06da0164f576c9f774'
