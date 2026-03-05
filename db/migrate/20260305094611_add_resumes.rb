class AddResumes < ActiveRecord::Migration[8.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.text :description
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
