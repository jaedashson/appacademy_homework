class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      render json: 'Invalid Credentials, bozo'
    else
      login!(@user)
      redirect_to user_url(@user)
    end

  end

  def new
    render :new
  end

  def destroy
    logout!
    render :new
  end



end