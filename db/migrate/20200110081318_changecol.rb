class Changecol < ActiveRecord::Migration[6.0]
  def change
    add_index :followers, [:user_id, :following], :unique => true
  end
end
