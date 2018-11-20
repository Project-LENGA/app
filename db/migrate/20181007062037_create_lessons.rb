class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :tutor, index: true
      t.references :student, index: true
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.date :lesson_date, null: false

      t.timestamps
    end

    add_index :lessons, [ :tutor_id, :student_id ]
  end
end
