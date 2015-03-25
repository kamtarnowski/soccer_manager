class AddPlaceToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :place, :integer, :default => 0
  end
end
