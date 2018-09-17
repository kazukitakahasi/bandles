class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:top, :show, :search, :search_result]

  def top
  end

  def mypage
    @user = User.find(params[:id])
    @recruitmentband = Recruitment.find_by(user_id: current_user, recruitment_type: '0')
    @recruitmentadd = Recruitment.find_by(user_id: current_user, recruitment_type: '1')
    @users = User.where.not(id: current_user.id)
    @messages = Message.where(user_id: current_user, recipient_user: @users).distinct
    @messages2 = Message.where(user_id: @users, recipient_user: current_user).distinct
  end

  def show
    @user = User.find(params[:id])
    @user_categories = @user.user_categories
    @user_charges = @user.user_charges
    @favorite_artists = @user.favorite_artists
    @favorite_albums = @user.favorite_albums
    @favorite_songs = @user.favorite_songs

    @good_evaluation = GoodEvaluation.where(evaluated_user: @user.id)
    @good_evaluationexist = GoodEvaluation.find_by(user_id: current_user, evaluated_user: @user.id)
    @bad_evaluation = BadEvaluation.where(evaluated_user: @user.id)
    @bad_evaluationexist = BadEvaluation.find_by(user_id: current_user, evaluated_user: @user.id)
  end

  def search
    @q = User.includes(:user_charges, :charges, :user_categories, :categories, :favorite_artists, :favorite_albums, :favorite_songs ).ransack(params[:q])
    @users = User.all
  end

  def search_result
    @q = User.includes(:user_charges, :charges, :user_categories, :categories ).ransack(params[:q])
    @searchresult = @q.result.page(params[:page]).per(20).distinct.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    @user_categories = @user.user_categories
    @user_charges = @user.user_charges
    @favorite_artists = @user.favorite_artists
    @favorite_albums = @user.favorite_albums
    @favorite_songs = @user.favorite_songs
    @good_evaluation = GoodEvaluation.where(evaluated_user: @user.id)
    @bad_evaluation = BadEvaluation.where(evaluated_user: @user.id)
    if @user.id == current_user.id
      render :edit
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_profile
    @user = User.find(params[:id])

    if @user.user_categories.blank?
      5.times {@user.user_categories.build}
    else @user.user_categories.count < 5
      @count = 5 - @user.user_categories.count
      @count.times {@user.user_categories.build}
    end

    if @user.user_charges.blank?
      5.times {@user.user_charges.build}
    else @user.user_charges.count < 5
      @count = 5 - @user.user_charges.count
      @count.times {@user.user_charges.build}
    end

    if @user.favorite_artists.blank?
      5.times {@user.favorite_artists.build}
    else @user.favorite_artists.count < 5
      @count = 5 - @user.favorite_artists.count
      @count.times {@user.favorite_artists.build}
    end

    if @user.favorite_albums.blank?
      5.times {@user.favorite_albums.build}
    else @user.favorite_albums.count < 5
      @count = 5 - @user.favorite_albums.count
      @count.times {@user.favorite_albums.build}
    end

    if @user.favorite_songs.blank?
      5.times {@user.favorite_songs.build}
    else @user.favorite_songs.count < 5
      @count = 5 - @user.favorite_songs.count
      @count.times {@user.favorite_songs.build}
    end

    if @user.id == current_user.id
      render :edit_profile
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_profile_image
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_profile_image
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_email
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_email
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_password
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_password
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #binding.pry
      flash[:success] = 'successfully updated'
      redirect_to edit_user_path(@user.id)
    else
      redirect_to mypage_user_path(@user.id)
    end
  end

  private
    def user_params
      params.require(:user).permit(:email,:encrypted_password,:name,:profile_image,:gender,:birthday,:pref,:url,:introduction, user_charges_attributes: [:id, :charge_id], user_categories_attributes: [:id, :category_id], favorite_artists_attributes: [:id, :name], favorite_albums_attributes: [:id, :name], favorite_songs_attributes: [:id, :name])
    end
end
