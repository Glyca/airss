class ChangeArticleTitleAndUrl < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.change :title, :text
      t.change :url, :text
      t.change :image_url, :text
    end
  end
end
