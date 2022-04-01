class CreateStatusComments < ActiveRecord::Migration[7.0]
  def change
    create_table :status_comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :status, :users
  add_index :status, [:user_id, :created_at]
  end
end
