class OneTrueValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value
            model = record.class
            count = model.where(attribute => true).count
            if count > 0 # we're not the first
                unless record.id and model.find(record.id)[attribute] # we were already the default
                    record.errors[attribute] << (options[:message] || "There can only be one default #{record.class}")
                end
            end
        end
    end
end
