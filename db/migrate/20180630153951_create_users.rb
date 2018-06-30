class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :token
      t.string :time
      t.string :name
      t.string :surname
      t.string :mac
    end
    add_index :users, :mac, unique: true
  end
end
