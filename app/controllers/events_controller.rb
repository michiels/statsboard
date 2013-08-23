class EventsController < ApplicationController

  respond_to :js

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:happened_on, :description)
  end

end
