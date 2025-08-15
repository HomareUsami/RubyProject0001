class GreetingUser < ApplicationRecord
  # password関連
  has_secure_password

  # greetingを複数保持することが可能
  has_many :greetings

  attr_accessor :force_password_validation

  # validation options
  # on: :createとした場合create時のみチェックするようになる。passwordを更新する際もチェックする必要がある
  validates :user_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  # 更新時はフラグが true の場合に必須
  validates :password, presence: true, length: { minimum: 6 }, if: :force_password_validation, on: :update

  # remember_tokenの生成と戻り値で値を返却する
  # rubyは最後に記載したものが基本的に戻り値になる
  def generate_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    save!
    remember_token
  end
end
