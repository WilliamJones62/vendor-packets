class ChangeAdditionalInteger1FormatInProducts < ActiveRecord::Migration[5.1]
  def change
   change_column :products, :additional_integer_1, :boolean
  end
end
