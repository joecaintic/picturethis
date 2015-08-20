class MessagesController < ApplicationController
  # before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    @new_message = Message.new

    @path = conversation_path(@conversation)

    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:body,:body2, :image, :image_cache)
  end

end
