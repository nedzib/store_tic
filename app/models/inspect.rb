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
class Inspect < ApplicationRecord
  belongs_to :kind
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

  # Callbacks
  before_update :set_status_updated_at, if: :will_save_change_to_status?
  before_save :set_hash_finder
  after_update :set_end_date_if_finished, if: :saved_change_to_status?

  private

  # Método para actualizar el campo status_updated_at
  def set_status_updated_at
    self.status_updated_at = Time.current
  end

  # Método para actualizar el campo hash_finder
  def set_hash_finder
    return if hash_finder.present?
    self.hash_finder = SecureRandom.hex 9
  end

  # Método para establecer end_date cuando el estado sea finished
  def set_end_date_if_finished
    if status == "finished" && end_date.nil?
      self.end_date = Time.current
      save(validate: false) # Evita la validación al guardar para evitar un loop infinito
    end
  end
end

