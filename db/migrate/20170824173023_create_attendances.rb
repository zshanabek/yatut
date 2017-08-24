class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :first_name
      t.string :last_name
      t.float :latitude
      t.float :longitude
      t.references :subject, foreign_key: true, index:true
      t.timestamps
    end
  end
end
