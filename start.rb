#! /usr/bin/env ruby

require 'securerandom'

commands = []

%w(SECRET_KEY SECRET_TOKEN SECRET_KEY_BASE DEVISE_SECRET_KEY).each do |e|
  commands.push "export #{e}=#{SecureRandom.hex(64)}"
end

`
#{commands.join('\n')}
bundle exec rails s -p 4000 -e production
`
