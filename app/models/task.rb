# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :issuer, presence: true

  enum status: { unassigned: 0 }
end
