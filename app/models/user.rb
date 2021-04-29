class User < ApplicationRecord
  has_many :events, inverse_of: :creator
  has_many :invitations
  has_many :attended_events, through: :invitations, source: :event
end
