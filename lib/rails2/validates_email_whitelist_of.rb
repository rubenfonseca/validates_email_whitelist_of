module SimplesIdeias
  module ValidatesEmailWhitelistOf
    def validates_email_whitelist_of(*attr_names)
      options = {
        :on          => :save,
        :allow_nil   => false,
        :allow_blank => false,
        :whitelist   => []
      }

      options.update(attr_names.pop) if attr_names.last.kind_of?(Hash)

      validates_each(attr_names, options) do |record, attr_name, value|
        if value.to_s =~ EMAIL_FORMAT
          message = ::I18n.t(:invalid_whitelist, :scope => 'activerecord.errors.messages')
          record.errors.add(attr_name, message) unless options[:whitelist].include?($2)
        else
          message = ::I18n.translate(options[:message], :default => [:"activerecord.errors.messages.invalid_email", "is not a valid address"])
          record.errors.add(attr_name, message)
        end
      end
    end

    def validates_email_blacklist_of(*attr_names)
      options = {
        :on          => :save,
        :allow_nil   => false,
        :allow_blank => false,
        :blacklist   => []
      }

      options.update(attr_names.pop) if attr_names.last.kind_of?(Hash)

      validates_each(attr_names, options) do |record, attr_name, value|
        if value.to_s =~ EMAIL_FORMAT
          message = ::I18n.t(:invalid_blacklist, :scope => 'activerecord.errors.messages')
          record.errors.add(attr_name, message) if options[:blacklist].include?($2)
        else
          message = ::I18n.translate(options[:message], :default => [:"activerecord.errors.messages.invalid_email", "is not a valid address"])
          record.errors.add(attr_name, message)
        end
      end
    end
  end
end

class ActiveRecord::Base
  extend SimplesIdeias::ValidatesEmailWhitelistOf
end
