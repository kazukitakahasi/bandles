class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.all.page(params[:page]).per(30).reverse_order
  end

  def show
  	@user = User.find(params[:id])
  	@user_categories = @user.user_categories
    @user_charges = @user.user_charges
    @favorite_artists = @user.favorite_artists
    @favorite_albums = @user.favorite_albums
    @favorite_songs = @user.favorite_songs
    @good_evaluation = GoodEvaluation.where(evaluated_user: @user.id)
    @bad_evaluation = BadEvaluation.where(evaluated_user: @user.id)
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    flash[:success] = 'ユーザーを削除しました'
  	redirect_to admins_users_path
  end

  private
    def user_params
      params.require(:user).permit(:email,:encrypted_password,:name,:profile_image,:gender,:birthday,:pref,:url,:introduction, user_charges_attributes: [:id, :charge_id], user_categories_attributes: [:id, :category_id], favorite_artists_attributes: [:id, :name], favorite_albums_attributes: [:id, :name], favorite_songs_attributes: [:id, :name])
    end
end
