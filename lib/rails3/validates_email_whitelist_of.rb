module ActiveModel
  module Validations
    class EmailWhitelistValidator < EachValidator
      def validate_each(record, attribute, value)
        if value.to_s !~ SimplesIdeias::ValidatesEmailWhitelistOf::EMAIL_FORMAT
          record.errors.add(attribute, :invalid_email, :default => options[:message], :value => value)
        else
          if options[:whitelist] && !options[:whitelist].include?($2)
            record.errors.add(attribute, :invalid_whitelist, :default => options[:message], :value => value)
          end

          if options[:blacklist] && options[:blacklist].include?($2)
            record.errors.add(attribute, :invalid_blacklist, :default => options[:message], :value => value)
          end
        end
      end
    end

    module ClassMethods
      def validates_email_whitelist_of(*attr_names)
        validates_with EmailWhitelistValidator, _merge_attributes(attr_names)
      end

      def validates_email_blacklist_of(*attr_names)
        validates_with EmailWhitelistValidator, _merge_attributes(attr_names)
      end
    end
  end
end
