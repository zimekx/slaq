class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @messages = Message.limit(10).order(created_at: :desc).reverse.group_by(&:room_id)
    @rooms = Room.all
    @user = current_user

    respond_to do |format|
      format.html
      format.json
    end
  end
end
