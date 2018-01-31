class CreateProgressUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :progress_updates do |t|
      t.integer :project_id
      t.text    :content
      t.timestamps
    end
  end
end
