class Greeting < ApplicationRecord
  # userを単体保持,1挨拶に対して1ユーザーを紐づける。
  belongs_to :greeting_user, optional: true

  # 空メッセージは許容しない。
  validates :message, presence: true
end
