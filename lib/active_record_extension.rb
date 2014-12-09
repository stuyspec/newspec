module ActiveRecordExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def alt_name(old, new)
      define_method "#{new}" do
        self.send old
      end
      define_method "#{new}=" do |val|
        self.send "#{old}=", val
      end
    end

    def make_has(*attrs)
      attrs.each do |attr|
        define_method "has_#{attr}?" do
          not self.send(attr).nil?
        end
      end
    end

  end

end

ActiveRecord::Base.send(:include, ActiveRecordExtension)
