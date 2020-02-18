class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :status
      t.references :requester, null: false
      t.references :requested, null: false

      t.timestamps
    end
    add_foreign_key :requests, :users, column: :requester_id, primary_key: :id
    add_foreign_key :requests, :users, column: :requested_id, primary_key: :id
  end
end
