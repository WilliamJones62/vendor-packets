class RemoveHaccp1ScoreFromPackets < ActiveRecord::Migration[5.1]
  def change
    remove_column :packets, :haccp_1_score, :integer
  end
end
