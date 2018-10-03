class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :datetime
      t.bigint :user
      t.integer :os
      t.integer :device

      t.timestamps
    end
  end
end
