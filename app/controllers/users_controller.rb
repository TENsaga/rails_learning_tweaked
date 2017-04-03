class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger (control d to escape, comment to remove)
  end

  def new
    @user = User.new
  end
end
