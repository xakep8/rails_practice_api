class AddConstraintsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :email, unique: true
    change_column_null :users, :email, false
  end
end
