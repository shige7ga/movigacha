#!/bin/bash
set -e

rm -f tmp/pids/server.pid

bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rake 'tailwindcss:watch[always]' &

exec bundle exec rails server -b '0.0.0.0'
