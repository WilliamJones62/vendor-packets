class AddHaccp2ScoreToPackets < ActiveRecord::Migration[5.1]
  def change
    add_column :packets, :haccp_2_score, :string
  end
end
