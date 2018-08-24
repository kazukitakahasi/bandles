class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.where(recruitment_type: '0')
  end

  def subscription
    @recruitments = Recruitment.where(recruitment_type: '1')
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruitment_categories = @recruitment.recruitment_categories
    @recruitment_charges = @recruitment.recruitment_charges
  end

  def search
    @q = Recruitment.includes(:recruitment_charges, :charges, :recruitment_categories, :categories ).ransack(params[:q])
  end

  def search_result
    @q = Recruitment.includes(:recruitment_charges, :charges, :recruitment_categories, :categories ).ransack(params[:q])
    @searchresult = @q.result.page(params[:page]).per(30).distinct
  end

  def new
    @recruitment = Recruitment.new
    5.times {@recruitment.recruitment_charges.build}
    5.times {@recruitment.recruitment_categories.build}
  end

  def new_subscription
    @recruitment = Recruitment.new
    5.times {@recruitment.recruitment_charges.build}
    5.times {@recruitment.recruitment_categories.build}
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.user_id = current_user.id
    if @recruitment.save
      flash[:success] = 'successfully created'
      redirect_to mypage_user_path(current_user)
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  def edit
    @recruitment = Recruitment.find(params[:id])

    if @recruitment.recruitment_charges.blank?
      5.times {@recruitment.recruitment_charges.build}
    else @recruitment.recruitment_charges.count < 5
      @count = 5 - @recruitment.recruitment_charges.count
      @count.times {@recruitment.recruitment_charges.build}
    end

    if @recruitment.recruitment_categories.blank?
      5.times {@recruitment.recruitment_categories.build}
    else @recruitment.recruitment_categories.count < 5
      @count = 5 - @recruitment.recruitment_categories.count
      @count.times {@recruitment.recruitment_categories.build}
    end

    if @recruitment.user_id == current_user.id
      render :edit
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  def edit_subscription
    @recruitment = Recruitment.find(params[:id])

    if @recruitment.recruitment_charges.blank?
      5.times {@recruitment.recruitment_charges.build}
    else @recruitment.recruitment_charges.count < 5
      @count = 5 - @recruitment.recruitment_charges.count
      @count.times {@recruitment.recruitment_charges.build}
    end

    if @recruitment.recruitment_categories.blank?
      5.times {@recruitment.recruitment_categories.build}
    else @recruitment.recruitment_categories.count < 5
      @count = 5 - @recruitment.recruitment_categories.count
      @count.times {@recruitment.recruitment_categories.build}
    end

    if @recruitment.user_id == current_user.id
      render :edit_subscription
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      #binding.pry
      flash[:success] = 'successfully updated'
      redirect_to mypage_user_path(current_user)
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.destroy
      flash[:notice] = "記事を削除しました。"
      redirect_to mypage_user_path(current_user)
    else
      redirect_to mypage_user_path(current_user)
    end
  end

  private
    def recruitment_params
      params.require(:recruitment).permit(:recruitment_type,:title,:pref,:activity_area,:activity_day,:activity_direction,:recruitment_gender,:recruitment_age,:recruitment_age2,:playing_music,:sound_source,:introduction, recruitment_charges_attributes: [:id, :charge_id], recruitment_categories_attributes: [:id, :category_id] )
    end
end