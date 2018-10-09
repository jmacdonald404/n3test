class AddIndexesToVisits < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, [:user, :os, :device]
  end
end
