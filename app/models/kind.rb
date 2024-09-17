# == Schema Information
#
# Table name: kinds
#
#  id                   :bigint           not null, primary key
#  margin               :float
#  name                 :string
#  revision_price_cents :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Kind < ApplicationRecord
end
