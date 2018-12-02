class AddColumnsToLessonDatesOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_dates_options, :lesson_date, :date
    add_column :lesson_dates_options, :lesson_time, :time
  end
end
