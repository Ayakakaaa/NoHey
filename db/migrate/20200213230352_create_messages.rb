class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, null: false, foreign_key: true
      t.references :sender, null: false

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id

  end
end
