class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_paranoid

  def soft_delete
    update(deleted_at: Time.now)
  end

  def active_for_authentication?
    !deleted_at
  end

  def inactive_message
    !deleted_at? super: :deleted_account
  end

  include JpPrefecture
  jp_prefecture :pref

    def prefecture_name
      JpPrefecture::Prefecture.find(code: pref_id).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

  attachment :profile_image

  enum gender: { 男性: 0, 女性: 1 }

  has_many :recruitments
  has_many :bad_evaluations
  has_many :good_evaluations
  has_many :reports
  has_many :messages

  has_many :favorite_artists
  accepts_nested_attributes_for :favorite_artists, reject_if: :all_blank, allow_destroy: true
  has_many :favorite_albums
  accepts_nested_attributes_for :favorite_albums, reject_if: :all_blank, allow_destroy: true
  has_many :favorite_songs
  accepts_nested_attributes_for :favorite_songs, reject_if: :all_blank, allow_destroy: true

  has_many :user_charges
  accepts_nested_attributes_for :user_charges, reject_if: :all_blank, allow_destroy: true
  has_many :charges, through: :user_charges

  has_many :user_categories
  accepts_nested_attributes_for :user_categories, reject_if: :all_blank, allow_destroy: true
  has_many :categories, through: :user_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
