# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :require_login, only: [:create, :update, :destroy]
  before_action :host_user, only: [:create, :update, :new]

  def show
    @invitation = Event.find(params[:id])
    
    respond_to do |format|
      flash[:info] = "You have been redirected. Invitations managed on event pages."
      format.html { redirect_to root_url }
    end
  end

  def new
    @invitation = Invitation.new
  end

  def create
    host = User.find(current_user.id)
    @invitation = host.sent_invitations.build()
    @event = @invitation.event
    if @invitation.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.js
      end
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @event = @invitation.event
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
      end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @event = @invitation.event
    @reservation = @event.invitations.find_by(event_id: @event.id, invitee_id: current_user.id)
    @reservation.update_attribute(:attending, params[:attending])
    respond_to do |format|
      format.html { redirect_to @event }
      format.js
      format.json { render :partial => "invitations/show" }
    end
  end
end
