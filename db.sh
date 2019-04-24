#!/bin/bash
set -v
bin/rails db:drop
bin/rails db:migrate RAILS_ENV=development
bin/rails db:seed