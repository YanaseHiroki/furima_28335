class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    # params[:user][:birthday] = birthday_join
    @user = User.new(user_params) 

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  # private

  # def birthday_join
  #   date = params[:user][:birthday]
  #   require 'date'
  #   Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  # end

  # def user_params
  #   params.require(:user).permit(
  #     :email,
  #     :password,
  #     :nickname,
  #     :name_1,
  #     :name_2,
  #     :kana_1,
  #     :kana_2,
  #     :birthday
  #   )
  # end

end
