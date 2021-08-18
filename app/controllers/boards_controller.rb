class BoardsController < ApplicationController

  def new
    @board = Board.new #create action method for new.html.erb
  end

  def create
    @board = current_user.boards.create(board_params) #boards belong user

    if @board.save
      #format.turbo_stream format.html {
      redirect_to user_path(current_user)
    else
      render :new
      #format.turbo_stream
    end
  end

  private #to allows parameter to get through
    def board_params
      params.require(:board).permit(:name)
    end

end
