class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.integer :radius
      t.string :address

      t.timestamps
    end
  end
end
