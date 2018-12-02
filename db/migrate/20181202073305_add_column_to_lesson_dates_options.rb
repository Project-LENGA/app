class AddColumnToLessonDatesOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_dates_options, :lesson_duration, :int
  end
end
