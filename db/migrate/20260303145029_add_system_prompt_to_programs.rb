class AddSystemPromptToPrograms < ActiveRecord::Migration[8.1]
  def change
    add_column :programs, :system_prompt, :text
  end
end
