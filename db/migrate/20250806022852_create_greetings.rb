class CreateGreetings < ActiveRecord::Migration[8.0]
  def change
    create_table :greetings do |t|
      t.string :name
      t.text :message
      t.references :greeting_user, foreign_key: { on_delete: :nullify }, null: true
      t.timestamps
    end
  end
end
