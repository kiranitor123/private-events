class Invitation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :event
  belongs_to :invitee, class_name: 'User'

  # prevent sending a duplicate invitation to a user for the same event
  # validates_uniqueness_of :invitee_id, scope: 'event_id'

  scope :reservation_yes_past, -> { joins(:event).where('status = ? AND date < ?', 'yes', Time.zone.now) }
  scope :reservation_yes_future, -> { joins(:event).where('status = ? AND date > ?', 'yes', Time.zone.now) }
  scope :reservation_pending, -> { joins(:event).where('status = ? AND date > ?', 'no response', Time.zone.now) }
end
