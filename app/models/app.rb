class App < ApplicationRecord
  belongs_to :user

  has_many :error_groups, dependent: :destroy

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(20)
  end
end
