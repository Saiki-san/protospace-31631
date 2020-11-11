class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション
  validates :name,       presence: true # ユーザー名
  validates :profile,    presence: true # プロフィール
  validates :occupation, presence: true # 所属
  validates :position,   presence: true # 役職
  # アソシエーション
  has_many :prototypes
  # has_many :comments
  has_many :comments, dependent: :destroy # userが削除された場合、commentsも削除
end