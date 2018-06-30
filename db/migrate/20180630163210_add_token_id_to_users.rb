class AddTokenIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token_id, :integer
  end
end
