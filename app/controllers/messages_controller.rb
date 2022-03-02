class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def message_params
    params.require(:message).permit(:room_id, :message)
  end
end
