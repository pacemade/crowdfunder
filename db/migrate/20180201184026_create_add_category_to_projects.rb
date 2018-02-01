class CreateAddCategoryToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :name

      t.timestamps
    end
  end
end
