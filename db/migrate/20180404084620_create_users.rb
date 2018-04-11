class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :password_digest
      t.integer :role, default: 0
      t.boolean :active, default: true
      t.datetime :last_login_at
      t.jsonb :profile
      t.timestamps
      t.string :token
    end
  end
end