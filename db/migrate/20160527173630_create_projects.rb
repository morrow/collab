class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :html_id
      t.integer :css_id
      t.integer :javascript_id

      t.timestamps
    end
  end
end
