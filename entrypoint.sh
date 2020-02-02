#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

# Compile the assets
bundle exec rake assets:precompile

# Start the server
bundle exec rails server

# Create/migrate the database
bundle exec rake db:create db:migrate
