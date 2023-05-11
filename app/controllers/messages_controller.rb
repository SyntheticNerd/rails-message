class MessagesController < ApplicationController
  before_action :require_user

  def create
    print 'This is happenining'
    message = current_user.messages.new(message_params)
    return unless message.save

    ActionCable.server.broadcast('chatroom_channel', { message_body: message_render(message) })

    # redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: })
  end
end
