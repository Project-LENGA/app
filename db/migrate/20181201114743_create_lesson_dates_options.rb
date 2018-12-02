class CreateLessonDatesOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_dates_options do |t|
      t.boolean :is_reserved
      t.boolean :is_accepted
      t.date :date_accepted
      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
