class BoardsController < ApplicationController

  def new
    @board = Board.new #create action method for new.html.erb
  end

  def create
    @board = current_user.boards.create(board_params) #boards belong user
    #@boards = current_user.boards

    respond_to do |format|
    if @board.save
      format.turbo_stream   format.turbo_stream { render turbo_stream: turbo_stream.append('board_list', partial: 'boards/board', locals: { board: @board })}
      format.html { redirect_to user_path(current_user) }
    else
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@board, partial: 'boards/form', locals: { board: @board })}
    end
  end
end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)

    respond_to do |format|
      if @board.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace("board_#{@board.id}", partial: 'boards/show', locals: { board: @board })}
          #replace the show.html.erb
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@board, partial: 'boards/form', locals: { board: @board })}
      end
    end
  end

  def destroy
    @board =Board.find(params[:id])
    @board.destroy
    redirect_to user_path(current_user)
  end

  private #to allows parameter to get through
    def board_params
      params.require(:board).permit(:name)
    end
end

#turbo tag to wrap
#turbo_stream show the result
#redirect_to user_path(current_user)->redirect to showpage after save
#to play with turbo we need to creat a partial form to replace the elemet to the page we are visiting
#you need to have format.turbo_Stream .... to create a new boards and
