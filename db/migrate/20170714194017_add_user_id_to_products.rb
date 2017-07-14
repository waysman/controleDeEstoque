class AddUserIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :user_id, :integer
  end
end
