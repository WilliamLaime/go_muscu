class ProgramsController < ApplicationController
  def index
    redirect_to program_path(Program.first)
  end

  def show
    @program = Program.find_by(id: params[:id])
    if @program.nil?
      redirect_to program_path(Program.first), alert: "Programme introuvable."
    else
      @chats = @program.chats.where(user: current_user)
    end
  end
end
