class AddRankHistoryToApps < ActiveRecord::Migration
  def change
    add_column :apps, :rank_history, :text
  end
end
