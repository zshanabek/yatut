class AddRecurringToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :start_time, :datetime
    add_column :subjects, :starts_at, :time
    add_column :subjects, :ends_at, :time    
    add_column :subjects, :recurring, :text
  end
end
