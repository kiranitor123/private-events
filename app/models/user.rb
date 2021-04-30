class User < ApplicationRecord
  has_many :events, inverse_of: :creator
  has_many :sent_invitations, class_name: "Invitation", foreign_key: "user_id"
  has_many :invitations             
  has_many :invited_events, through: :invitations, class_name: "Event", source: :event
end
