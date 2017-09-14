class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.references :user, index: true, foreign_key: true
      t.references :engine, index: true, foreign_key: true
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
