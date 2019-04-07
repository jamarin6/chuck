class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :text
      t.string :category

      t.timestamps null: false
    end
  end
end
