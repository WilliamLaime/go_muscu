class CreatePrograms < ActiveRecord::Migration[8.1]
  def change
    create_table :programs do |t|
      t.string :workout
      t.string :description

      t.timestamps
    end
  end
end
