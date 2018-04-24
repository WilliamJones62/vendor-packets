class AddHaccp1ScoreToPackets < ActiveRecord::Migration[5.1]
  def change
    add_column :packets, :haccp_1_score, :string
  end
end
