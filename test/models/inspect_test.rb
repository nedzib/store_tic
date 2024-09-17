# == Schema Information
#
# Table name: inspects
#
#  id                :bigint           not null, primary key
#  body              :text
#  email             :string
#  end_date          :datetime
#  revision_date     :datetime
#  status            :integer
#  status_updated_at :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class InspectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
