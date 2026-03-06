class ResumesController < ApplicationController
  def index
    @resumes = Resume.joins(:chat).where(chats: { user_id: current_user.id }).order(created_at: :desc)
  end

  def create
    @chat = Chat.find(params[:chat_id])
    last_message = @chat.messages.last

    @resume = Resume.new(
      title: @chat.title,
      description: last_message.content,
      chat: @chat
    )
    if @resume.save
      redirect_to "#{chat_path(@chat)}#messages", notice: "Séance sauvegardée dans le dashboard ! "
    else
      redirect_to "#{chat_path(@chat)}#messages", alert: "Erreur lors de la sauvegarde."
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice: "Séance supprimée !"
  end
end
