module EventsHelper
  private

    def future_non_hosted_event?(event)
      Event.upcoming.include?(event) && current_user != event.creator
    end

    def current_user_is_host?
      current_user == @event.creator
    end
end
