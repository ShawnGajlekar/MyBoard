class AddUserIdToNotices < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :user_id, :integer
  end
end
