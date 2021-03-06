class FavController < ApplicationController
  # before_actionに「:authenticate_user」を追加してください
  before_action :authenticate_user

  # createアクションを追加してください
  def create
    @fav = Fav.new(user_id: @current_user.id, q_id: params[:q_id])
    @fav.save
    redirect_back(fallback_location: "/")
  end

  def destroy
    @fav = Fav.find_by(user_id: @current_user.id, q_id: params[:q_id])
    @fav.destroy
    redirect_back(fallback_location: "/")
  end

end
