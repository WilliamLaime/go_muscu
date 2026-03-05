class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
    @chats = @program.chats.where(user: current_user)
  end
end
