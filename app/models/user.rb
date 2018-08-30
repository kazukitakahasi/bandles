class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  MAX_FAVORITE_ARTISTS_LENGTH = 5
  MAX_FAVORITE_ALBUMS_LENGTH = 5
  MAX_FAVORITE_SONGS_LENGTH = 5
  MAX_USER_CHARGES_LENGTH = 5
  MAX_USER_CATEGORIES_LENGTH = 5

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
  has_many :bad_evaluations, dependent: :destroy
  has_many :good_evaluations, dependent: :destroy
  has_many :reports
  has_many :messages

  has_many :favorite_artists
  accepts_nested_attributes_for :favorite_artists, reject_if: :all_blank, allow_destroy: true
  validates :favorite_artists, length: {maximum: MAX_FAVORITE_ARTISTS_LENGTH}

  has_many :favorite_albums
  accepts_nested_attributes_for :favorite_albums, reject_if: :all_blank, allow_destroy: true
  validates :favorite_albums, length: {maximum: MAX_FAVORITE_ALBUMS_LENGTH}

  has_many :favorite_songs
  accepts_nested_attributes_for :favorite_songs, reject_if: :all_blank, allow_destroy: true
  validates :favorite_songs, length: {maximum: MAX_FAVORITE_SONGS_LENGTH}

  has_many :user_charges
  accepts_nested_attributes_for :user_charges, reject_if: :all_blank, allow_destroy: true
  has_many :charges, through: :user_charges
  validates :user_charges, length: {maximum: MAX_USER_CHARGES_LENGTH}

  has_many :user_categories
  accepts_nested_attributes_for :user_categories, reject_if: :all_blank, allow_destroy: true
  has_many :categories, through: :user_categories
  validates :user_categories, length: {maximum: MAX_USER_CATEGORIES_LENGTH}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
