class CreateApplis < ActiveRecord::Migration
  def change
    create_table :applis do |t|
      t.string :application_name
      t.text :application_description
      t.string :application_question
      t.text :define1
      t.text :define2
      t.text :define3
      t.text :define4
      t.text :define5

      t.timestamps null: false
    end
  end
end
