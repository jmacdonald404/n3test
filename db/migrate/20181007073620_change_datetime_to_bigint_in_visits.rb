class ChangeDatetimeToBigintInVisits < ActiveRecord::Migration[5.2]
  def change
    change_column :visits, :datetime, :bigint
  end
end
