module UsersHelper
  private

  def find_invitation(event)
    event.invitations.find_by(invitee_id: @user.id)
  end

  def yes_reservation_past
    @user.received_invitations.reservation_yes_past.includes(:event)
  end

  def yes_reservation_future
    @user.received_invitations.reservation_yes_future.includes(:event)  
  end

  def yes_reservation_pending
    @user.received_invitations.reservation_pending.includes(:event)
  end
end
