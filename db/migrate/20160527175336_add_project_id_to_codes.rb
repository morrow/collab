class AddProjectIdToCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :codes, :project_id, :integer
  end
end
