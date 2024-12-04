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
#  kind_id           :bigint           not null
#
# Indexes
#
#  index_inspects_on_kind_id  (kind_id)
#
# Foreign Keys
#
#  fk_rails_...  (kind_id => kinds.id)
#
require "test_helper"

class InspectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
