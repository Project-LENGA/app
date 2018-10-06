class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|

      t.timestamps null: false
    end
  end
end
