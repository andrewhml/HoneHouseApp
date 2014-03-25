class UsersController < ApplicationController
  def index
    if params[:term]
      @users = User.find(:all,:conditions => ['first_name ILIKE ?', "#{params[:term]}%"])
    else
      @users = User.all
    end

    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
