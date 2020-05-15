class StatusController < ApplicationController
  before_action :authenticate_user

  def createcircle
    @status = Status.new(user_id: @current_user.id, q_id: params[:q_id], correct: true)
    @status.save
    redirect_to("/library/#{params[:q_id]}")
  end

  def createcross
    @status = Status.new(user_id: @current_user.id, q_id: params[:q_id], correct: false)
    @status.save
    redirect_to("/library/#{params[:q_id]}")
  end

  def destroy
    @status = Status.find_by(user_id: @current_user.id, q_id: params[:q_id])
    @status.destroy
    redirect_to("/library/#{params[:q_id]}")
  end

  def updatecircle
    @status = Status.find_by(user_id: @current_user.id, q_id: params[:q_id])
    @status.correct = true
    @status.save
    redirect_to("/library/#{params[:q_id]}")
  end

  def updatecross
    @status = Status.find_by(user_id: @current_user.id, q_id: params[:q_id])
    @status.correct = false
    @status.save
    redirect_to("/library/#{params[:q_id]}")
  end

end
