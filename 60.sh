#!/bin/bash

MAX_PRIME_INDEX=2500
SET_SIZE=4

if [ ! -r "60_seed_data.rb" ]
then
  echo "Regenerating seed data - this may take a while"
  ./60_make_seed_data.rb $MAX_PRIME_INDEX > 60_seed_data.rb
fi

echo "Using 60_seed_data.rb"
./60.rb $MAX_PRIME_INDEX $SET_SIZE
