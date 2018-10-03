class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.int :datetime
      t.bigint :user
      t.int :os
      t.int :device

      t.timestamps
    end
  end
end
