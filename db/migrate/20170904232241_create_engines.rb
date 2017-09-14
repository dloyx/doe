class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :engine_name
      t.text :engine_description
      t.string :engine_identity
      t.text :engine_define
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
