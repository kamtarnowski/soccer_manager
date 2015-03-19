class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :round, index: true

      t.timestamps null: false
    end
    add_foreign_key :matches, :rounds
  end
end
