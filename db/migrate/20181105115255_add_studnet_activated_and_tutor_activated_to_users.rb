class AddStudnetActivatedAndTutorActivatedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :student_activated, :boolean, default: false
    add_column :users, :tutor_activated, :boolean, default: false
  end
end
