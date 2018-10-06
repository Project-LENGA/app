class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :type

      t.timestamps null: false
    end
  end
end
