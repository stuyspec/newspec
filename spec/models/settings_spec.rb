require 'rails_helper'

describe Settings do
  describe Settings::DefaultRole do
    subject { Settings::DefaultRole }

    context "the class" do
      subject { Settings::DefaultRole }

      it "creates a default role" do
        expect { subject.get }.to change{ subject.count }.from(0).to(1)
        expect { subject.get }.not_to change{ subject.count }.from(1)
      end
    end

    context "the instance" do
      subject { Settings::DefaultRole.get }

      it "only has one instance" do
        create(:default_role)
        expect( Settings::DefaultRole.new value: 1 ).to be_invalid
      end

      it "can be set" do
        role = create(:role)
        subject.role = role
        expect(subject.role).to be_eql role
      end

      it "stops Role from being deleted" do
        expect{ Role.default.delete! }.to raise_error
      end

    end
  end
end
