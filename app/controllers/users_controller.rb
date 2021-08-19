class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @boards = current_user.boards #get boards all belong to the current user
  end

end
