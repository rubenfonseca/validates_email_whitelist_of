validates_email_whitelist_of
============================

Plugin for ActiveRecord for validating email format and whitelisting the domain.

Works on Rails 2+, Rails 3+ and Ruby 1.8+.

Usage
=====

Add the gem to your Rails Gemfile

  gem 'validates_email_whitelist_of'

	class User < ActiveRecord::Base
	  validates_email_whitelist_of :email, :whitelist => ['example.com', 'google.com']
	end

On ActiveRecord 3.0+ you can do

	class User < ActiveRecord::Base
	  validates :email, :whitelist => true
	end

If you want to use I18n, make sure you add the scope

  `activerecord.errors.messages.invalid_email`
  `activerecord.errors.messages.invalid_whitelist`

or

  `errors.messages.invalid_email`
  `errors.messages.invalid_whitelist`

The following locales are builtin:

* pt
* pt-BR
* en

Copyright (c) 2011 Ruben Fonseca, released under the MIT license
