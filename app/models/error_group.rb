class ErrorGroup < ApplicationRecord
  belongs_to :app

  has_many :error_occurrences, dependent: :destroy
end
