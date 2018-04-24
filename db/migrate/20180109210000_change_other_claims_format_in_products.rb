class ChangeOtherClaimsFormatInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :other_claims, :boolean
  end
end
