require 'spec_helper'
require 'ostruct'
require_relative '../../services/default'

RSpec.describe Default, :new do
  let(:vals) do
    {
     issue: 3,
     year: 2012,
     status: :pending,
     publish_date: DateTime.now + 2.weeks
    }
  end

  %i(issue year status publish_date).each do |attr|

    describe ".#{attr}" do
      key = "default_#{attr}".to_sym

      it "creates a #{key} in the database" do
        db = class_spy('Storage', :has_key? => false)
        default =  Default.new db, DateTime.parse("June 22 1998")

        default.send attr

        expect(db).to have_received(:'[]=').with(key, anything)
      end

      it "retrieves the #{key} from the database" do
        db = class_spy('Storage')
        allow(db).to receive('[]').with(key).and_return(vals[attr])

        default =  Default.new db, DateTime.parse("June 22 1998")
        expect(default.send attr).to be_eql vals[attr]
      end
    end

  end

end
