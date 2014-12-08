class DefaultValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value
            model = record.class
            count = model.count(attribute: true)
            if count > 0 # we're not the first
                old = model.find(record.id)
                unless old[attribute] # we were already the default
                    record.errors[attribute] << (options[:message] || "There can only be one default #{record.class}")
                end
            end
        end
    end
end
