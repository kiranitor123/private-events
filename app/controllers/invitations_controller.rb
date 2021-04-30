# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :require_login

  def create
    event = Event.find(params[:event_id])
    invitation = Invitation.new(event_id: event.id, user_id: params[:user_id])

    if invitation.save
      invitation.invited!
      flash[:notice] = 'Invitation sent!'
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Error'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    invitation = Invitation.find(params[:id])
    if current_user == event.creator
      invitation.destroy
      flash[:notice] = 'The invitation is cancelled!'
    else
      invitation.invited!
      invitation.save
      flash[:notice] = 'You have dropped the invitation !'
    end

    redirect_to users_path(event_id: event.id, id: invitation.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @invitation = Invitation.find_by(event_id: params[:event_id], user_id: current_user.id)

    if @invitation&.invited?
      @invitation.accepted!

      flash[:notice] = 'Thank you for signing up'
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end

    redirect_to event_path(@event)
  end
end
