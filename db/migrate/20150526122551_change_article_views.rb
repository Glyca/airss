class ChangeArticleViews < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.change :views, :integer, {:null => false}
    end
  end
end
