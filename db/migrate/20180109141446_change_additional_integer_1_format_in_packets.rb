class ChangeAdditionalInteger1FormatInPackets < ActiveRecord::Migration[5.1]
  def change
    change_column :packets, :additional_integer_1, :boolean
  end
end
