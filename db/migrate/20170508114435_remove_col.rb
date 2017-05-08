class RemoveCol < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :userid
  end
end
