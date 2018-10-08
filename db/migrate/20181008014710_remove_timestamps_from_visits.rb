class RemoveTimestampsFromVisits < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :created_at, :string
    remove_column :visits, :updated_at, :string
  end
end
