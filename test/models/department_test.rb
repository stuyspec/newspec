# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  editor_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test "creates a department without an editor" do
    assert Department.create name: "Web"
  end

  test "creates a department with an editor" do
    assert Department.create name: "Humor", editor: users(:miki)
  end
end
