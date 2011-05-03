module SimplesIdeias
  module ValidatesEmailWhitelistOf
    EMAIL_FORMAT = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end

if ActiveRecord::VERSION::STRING >= "3.0"
  require "rails3/validates_email_whitelist_of"
else
  require "rails2/validates_email_whitelist_of"
end
