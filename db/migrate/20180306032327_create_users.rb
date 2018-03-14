class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email

      t.timestamps
    end

    # Unique usernames
    add_index :users, :username, unique: true

    # Unique emails
    add_index :users, :email, unique: true
  end
end
