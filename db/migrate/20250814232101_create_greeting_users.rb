class CreateGreetingUsers < ActiveRecord::Migration[8.0]
  def change
    # null: false
    # DBにおける空を許容しない形式
    create_table :greeting_users do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      # password_digest has_secure_passwordで自動で使用される
      t.string :password_digest, null: false

      t.timestamps
    end

    # user_idを一意であると定義したうえでindex値を定義
    add_index :greeting_users, :user_id, unique: true
    # column追加 remember_tokenを覚えておきCookieなどの悪用を防ぐ
    add_column :greeting_users, :remember_token, :string
  end
end
