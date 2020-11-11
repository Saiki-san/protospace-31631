class Prototype < ApplicationRecord
  # バリデーション
  validates :title,      presence: true # プロトタイプの名称
  validates :catch_copy, presence: true # キャッチコピー
  validates :concept,    presence: true # コンセプト
  validates :image,      presence: true # プロトタイプの画像1枚
  # アソシエーション
  belongs_to :user
  # validates :user_id presence: true ←不要
  has_many :comments, dependent: :destroy # prototypeが削除された場合、commentsも削除
  has_one_attached :image
end
