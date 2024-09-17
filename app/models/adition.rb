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
#
class Adition < ApplicationRecord
  belongs_to :inspect
end
