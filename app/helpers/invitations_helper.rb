# frozen_string_literal: true

module InvitationsHelper
  def accepted?(invitation)
    invitation.status == 'approved'
  end
end
