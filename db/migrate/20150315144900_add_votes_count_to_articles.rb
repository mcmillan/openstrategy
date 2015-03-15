class AddVotesCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :votes_count, :integer, default: 0
  end
end
