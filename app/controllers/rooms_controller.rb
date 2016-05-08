class RoomsController < ApplicationController
  def show
    @messages = Message.limit(10).order(created_at: :desc).reverse

    respond_to do |format|
      format.html
      format.json
    end
  end
end
