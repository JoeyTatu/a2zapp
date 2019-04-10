class ChangePublishedInEntriesTable < ActiveRecord::Migration
  def change
    rename_column :entries, :publushed, :published 
  end
end
