class Recruitment < ApplicationRecord

	include JpPrefecture
  	jp_prefecture :pref

      def prefecture_name
        JpPrefecture::Prefecture.find(code: pref_id).try(:name)
      end

      def prefecture_name=(prefecture_name)
        self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
      end

    enum recruitment_type: { バンドメンバー募集: 0, バンド加入希望: 1}
	enum activity_area: { 指定なし: 0, 北部: 1, 南部: 2, 中部: 3, 西部: 4, 東部: 5}
	enum activity_day: { 指定なし: 0, 毎日: 1, 週1回: 2, 週数回: 3, 月1回: 4, 月数回: 5, 不定期: 6}
	enum activity_direction: { 指定なし: 0, 趣味: 1, インディーズ志向: 2, プロ志向: 3}
	enum playing_music: { 指定なし: 0, コピー: 1, オリジナル: 2}
	enum recruitment_gender: { 指定なし: 0, 男性: 1, 女性: 2}

	belongs_to :user, -> { with_deleted}
	has_many :recruitment_charges, dependent: :destroy
	accepts_nested_attributes_for :recruitment_charges, reject_if: :all_blank, allow_destroy: true
	has_many :charges, through: :recruitment_charges

	has_many :recruitment_categories, dependent: :destroy
	accepts_nested_attributes_for :recruitment_categories, reject_if: :all_blank, allow_destroy: true
	has_many :categories, through: :recruitment_categories
end
