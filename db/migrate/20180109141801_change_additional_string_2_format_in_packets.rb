class ChangeAdditionalString2FormatInPackets < ActiveRecord::Migration[5.1]
  def change
    change_column :packets, :additional_string_1, :string
    change_column :packets, :additional_string_2, :string
    change_column :packets, :additional_string_3, :string
    change_column :packets, :additional_string_4, :string
    change_column :packets, :additional_string_5, :string
    change_column :packets, :problems_1, :string
  end
end
