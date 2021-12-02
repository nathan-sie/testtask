class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :create_time
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
