class AddRecurringToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :start_time, :time
    add_column :subjects, :end_time, :time
    add_column :subjects, :date, :date
  end
end
