class RemoveHaccp2ScoreFromPackets < ActiveRecord::Migration[5.1]
  def change
    remove_column :packets, :haccp_2_score, :integer
  end
end
