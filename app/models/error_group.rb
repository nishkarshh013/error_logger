class ErrorGroup < ApplicationRecord
  belongs_to :app

  has_many :error_occurrences, dependent: :destroy

  # Association for latest occurrence
  has_one :latest_occurrence, -> { order(created_at: :desc) }, class_name: 'ErrorOccurrence'

  # Delegate the `updated_at` method
  delegate :updated_at, to: :latest_occurrence, prefix: true, allow_nil: true
end
