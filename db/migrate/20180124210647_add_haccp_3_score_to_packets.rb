class AddHaccp3ScoreToPackets < ActiveRecord::Migration[5.1]
  def change
    add_column :packets, :haccp_3_score, :string
  end
end
