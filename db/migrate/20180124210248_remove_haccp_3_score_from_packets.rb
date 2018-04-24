class RemoveHaccp3ScoreFromPackets < ActiveRecord::Migration[5.1]
  def change
    remove_column :packets, :haccp_3_score, :integer
  end
end
