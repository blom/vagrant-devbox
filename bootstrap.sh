#!/usr/bin/env bash

cat > /etc/gemrc <<__EOF__
gem: --no-rdoc --no-ri
:sources:
  - https://rubygems.org/
__EOF__

if ! gem list | grep -q librarian-puppet; then
  gem install librarian-puppet
fi

cd /vagrant

librarian-puppet install
