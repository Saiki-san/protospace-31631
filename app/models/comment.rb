class Comment < ApplicationRecord
  # バリデーション
  validates :text, presence: true # テキスト
  # アソシエーション
  belongs_to :user
  belongs_to :prototype
end
