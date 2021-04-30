# frozen_string_literal: true

class Invitation < ApplicationRecord
  enum status: { invited: false, accepted: true }

  belongs_to :user
  belongs_to :event
end
