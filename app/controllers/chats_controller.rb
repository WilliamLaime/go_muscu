class ChatsController < ApplicationController
  def show
    @chat = current_user.chats.find(params[:id])
    @message = Message.new
  end

  def create
    @program = Program.find(params[:program_id])

    @chat = Chat.new(title: "Programme")
    @chat.program = @program
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = @program.chats.where(user: current_user)
      render "programs/show"
    end
  end

  def destroy
    @program = Program.find(params[:program_id])
    @chat = @program.chats.find(params[:id])
    @chat.destroy
    redirect_to program_path(@program), status: :see_other
  end
end
