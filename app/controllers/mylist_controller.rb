class MylistController < ApplicationController
  # before_actionに「:authenticate_user」を追加してください
  before_action :authenticate_user

  # createアクションを追加してください
  def create
    @mylist = Mylist.new(user_id: @current_user.id, q_id: params[:q_id])
    @mylist.save
    redirect_back(fallback_location: "/")
  end

  def destroy
    @mylist = Mylist.find_by(user_id: @current_user.id, q_id: params[:q_id])
    @mylist.destroy
    redirect_back(fallback_location: "/")
  end

end
