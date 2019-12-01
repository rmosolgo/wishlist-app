class AddDefaultFalseToChecked < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:items, :checked, from: nil, to: false)
  end
end
