class MessagesController < ApplicationController
  def index
  	@message = Message.new
  	@user = User.find(params[:user_id])
  	@recipient_user = User.find(params[:id])
  	@messages = Message.where( "(user_id = ? ) OR (user_id = ? )", current_user,@recipient_user.id).where( "(recipient_user = ? ) OR (recipient_user = ? )", current_user,@recipient_user.id )
  	#binding.pry
    if @user.id == current_user.id
      render :index
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  def create
  	@message = Message.new(message_params)
  	@recipient_user = User.find(params[:id])
  	@message.user_id = current_user.id
  	@message.recipient_user = @recipient_user.id
  	#binding.pry
  	@message.save
  	redirect_to user_recipient_user_messages_path(current_user.id, @recipient_user.id)
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :content, :recipient_user )
    end
end
