class Recruitment < ApplicationRecord

	MAX_RECRUITMENT_CHARGES_LENGTH = 5
    MAX_RECRUITMENT_CATEGORIES_LENGTH = 5

	include JpPrefecture
  	jp_prefecture :pref

      def prefecture_name
        JpPrefecture::Prefecture.find(code: pref_id).try(:name)
      end

      def prefecture_name=(prefecture_name)
        self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
      end

    enum recruitment_type: { バンドメンバー募集: 0, バンド加入希望: 1}
	enum activity_area: { 指定なし: 0, 北部: 1, 南部: 2, 中部: 3, 西部: 4, 東部: 5}, _suffix: true
	enum activity_day: { 指定なし: 0, 毎日: 1, 週1回: 2, 週数回: 3, 月1回: 4, 月数回: 5, 不定期: 6}, _suffix: true
	enum activity_direction: { 指定なし: 0, 趣味: 1, インディーズ志向: 2, プロ志向: 3}, _suffix: true
	enum playing_music: { 指定なし: 0, コピー: 1, オリジナル: 2}, _suffix: true
	enum recruitment_gender: { 指定なし: 0, 男性: 1, 女性: 2}, _suffix: true

	ACTIVITYAREA = [ ["北部",1], ["南部",2], ["中部",3], ["西部",4], ["東部",5] ]
	ACTIVITYDAY = [ ["毎日",1], ["週1回",2], ["週数回",3], ["月1回",4], ["月数回",5], ["不定期",6] ]
	ACTIVITYDIRECTION = [ ["趣味",1], ["インディーズ志向",2], ["プロ志向",3] ]
	PLAYINGMUSIC = [ ["コピー",1], ["オリジナル",2] ]
	GENDER = [ ["男性",1], ["女性",2] ]

	belongs_to :user
	has_many :recruitment_charges, dependent: :destroy
	accepts_nested_attributes_for :recruitment_charges, reject_if: :all_blank, allow_destroy: true
	has_many :charges, through: :recruitment_charges
	validates :recruitment_charges, length: {maximum: MAX_RECRUITMENT_CHARGES_LENGTH}

	has_many :recruitment_categories, dependent: :destroy
	accepts_nested_attributes_for :recruitment_categories, reject_if: :all_blank, allow_destroy: true
	has_many :categories, through: :recruitment_categories
	validates :recruitment_categories, length: {maximum: MAX_RECRUITMENT_CATEGORIES_LENGTH}

	validates :title,
    presence:true
end
