class ChangeAdditionalString1FormatInPackets < ActiveRecord::Migration[5.1]
  def change
    change_column :packets, :additional_string_1, :date
    change_column :packets, :additional_string_2, :date
    change_column :packets, :additional_string_3, :date
    change_column :packets, :additional_string_4, :date
    change_column :packets, :additional_string_5, :date
    change_column :packets, :problems_1, :date
  end
end
