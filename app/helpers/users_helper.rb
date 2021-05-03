# frozen_string_literal: true

module UsersHelper

  def find_invitation(event)
    event.invitations.find_by(invitee_id: @user.id)
  end

  def yes_reservation_past
    @user.invitations.reservation_yes_past.includes(:event)
  end

  def yes_reservation_future
    @user.invitations.reservation_yes_future.includes(:event)  
  end

  def yes_reservation_pending
    @user.invitations.reservation_pending.includes(:event)
  end
end
