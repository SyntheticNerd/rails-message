class ChatroomController < ApplicationController
  def index
    redirect_to home_path unless logged_in?
    @messages = Message.all
    @message = Message.new
  end
end
