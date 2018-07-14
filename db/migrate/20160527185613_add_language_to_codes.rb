class AddLanguageToCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :codes, :language, :string
  end
end
