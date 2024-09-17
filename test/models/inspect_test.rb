# == Schema Information
#
# Table name: inspects
#
#  id                :bigint           not null, primary key
#  body              :text
#  email             :string
#  end_date          :datetime
#  hash_finder       :string
#  phone             :string
#  revision_date     :datetime
#  revision_time     :string
#  status            :integer          default("requested")
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
