class RemoveHtmlCssJavascriptFieldsFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :html_id
    remove_column :projects, :css_id
    remove_column :projects, :javascript_id
  end
end
