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
class Inspect < ApplicationRecord
  has_one :user
  has_one :kind
  has_many :aditions

  # Definición del enum para el status en inglés
  enum status: {
    requested: 0,
    received: 1,
    in_progress: 2,
    waiting_for_client: 3,
    finished: 4,
    canceled: 5
  }

  # Callback para actualizar status_updated_at cuando cambie el status
  before_update :set_status_updated_at, if: :will_save_change_to_status?
  before_save :set_hash_finder

  private

  # Método para actualizar el campo status_updated_at
  def set_status_updated_at
    self.status_updated_at = Time.current
  end

  def set_hash_finder
    self.hash_finder = SecureRandom.hex 9
  end
end
