class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @chats = @program.chats.where(user: current_user)
  end
end
