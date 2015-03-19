class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :status
      t.integer :number

      t.timestamps null: false
    end
  end
end
