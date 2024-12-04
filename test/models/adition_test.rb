# == Schema Information
#
# Table name: aditions
#
#  id          :bigint           not null, primary key
#  body        :text
#  name        :string
#  price_cents :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  inspect_id  :bigint           not null
#
# Indexes
#
#  index_aditions_on_inspect_id  (inspect_id)
#
# Foreign Keys
#
#  fk_rails_...  (inspect_id => inspects.id)
#
require "test_helper"

class AditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
