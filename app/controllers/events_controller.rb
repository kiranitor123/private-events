class EventsController < ApplicationController
  before_action :require_login, except: [:index]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash[:alert] = "Some error"
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :user_id)
    end
end
