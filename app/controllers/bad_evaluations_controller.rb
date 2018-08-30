class BadEvaluationsController < ApplicationController
  def create
  	@user = User.find(params[:user_id])
    @bad_evaluation = current_user.bad_evaluations.new(evaluated_user: @user.id)
    @bad_evaluation.save


    @good_evaluation = current_user.good_evaluations.find_by(evaluated_user: @user.id)
    if @good_evaluation.blank?
    	redirect_to user_path(@user.id)
    else
    	@good_evaluation.destroy
        redirect_to user_path(@user.id)
    end
  end

  def destroy
  	@user = User.find(params[:user_id])
    @bad_evaluation = current_user.bad_evaluations.find_by(evaluated_user: @user.id)
    @bad_evaluation.destroy
    redirect_to user_path(@user.id)
  end

  private
    def user_params
      params.require(:user).permit(:email,:encrypted_password,:name,:profile_image,:gender,:birthday,:pref,:url,:introduction, user_charges_attributes: [:id, :charge_id], user_categories_attributes: [:id, :category_id], favorite_artists_attributes: [:id, :name], favorite_albums_attributes: [:id, :name], favorite_songs_attributes: [:id, :name])
    end
end
