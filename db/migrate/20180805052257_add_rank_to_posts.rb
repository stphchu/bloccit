class AddRankToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rank, :float
  end
end
