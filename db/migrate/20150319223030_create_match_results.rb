class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :points
      t.integer :scores
      t.references :team, index: true
      t.references :match, index: true

      t.timestamps null: false
    end
    add_foreign_key :match_results, :teams
    add_foreign_key :match_results, :matches
  end
end
