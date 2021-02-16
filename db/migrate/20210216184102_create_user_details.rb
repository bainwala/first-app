class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :username
      t.integer :wins
      t.integer :losses
      t.integer :current_tokens

      t.timestamps
    end
  end
end
